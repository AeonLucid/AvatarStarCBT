const baseAddress = Module.getBaseAddress('AvatarStar.exe');

console.log(baseAddress);

Interceptor.attach(ptr(0x4214F0), {
    onEnter: function(args) {
        console.log('Log[0]', args[0].readCString());
    }
});

Interceptor.attach(ptr(0x4215B0), {
    onEnter: function(args) {
        console.log('Log[1]', args[0].readCString());
    }
});

// Hook ws32 connect
const ws32Connect = Module.findExportByName('ws2_32.dll', 'connect');
const ws32Send = Module.findExportByName('ws2_32.dll', 'send');
const ws32SendTo = Module.findExportByName('ws2_32.dll', 'sendto');

console.log(ws32Send);
console.log(ws32SendTo);

Interceptor.attach(ws32Connect!, {
    onEnter: function(args) {
        const pSocket = args[0].toInt32();

        console.log(`ws32 connect: pSocket=${pSocket}`);
    }
});

Interceptor.attach(ws32Send!, {
    onEnter: function(args) {
        const pSocket = args[0].toInt32();
        const pBuffer = args[1];
        const pSize = args[2].toInt32();
        const flags = args[3].toInt32();

        console.log(`ws32 send: pSocket=${pSocket}, pBuffer=${pBuffer}, pSize=${pSize}, flags=${flags}`);
        // console.log('Called send from:\n' + Thread.backtrace(this.context, Backtracer.FUZZY).map(DebugSymbol.fromAddress).join('\n') + '\n');
    }
});

// Hook HeapAlloc
// const heapAlloc = Module.findExportByName('kernel32.dll', 'HeapAlloc');

// Interceptor.attach(heapAlloc!, {
//     onEnter: function(args) {
//         const hHeap = args[0].toInt32();
//         const dwFlags = args[1].toInt32();
//         const dwBytes = args[2].toInt32();

//         if (dwBytes == 33) {
//             this.target = true;
//             console.log(`HeapAlloc: hHeap=${hHeap}, dwFlags=${dwFlags}, dwBytes=${dwBytes}`);
//             console.log('Called alloc from:\n' + Thread.backtrace(this.context, Backtracer.FUZZY).map(DebugSymbol.fromAddress).join('\n') + '\n');
//         } else {
//             this.target = false;
//         }
//     },
//     onLeave: function(retval) {
//         if (this.target) {
//             console.log('HeapAlloc retval:', retval);
//         }
//     }
// });

// Hook free
// const free = Module.findExportByName(null, 'free');

// Interceptor.attach(free!, {
//     onEnter: function(args) {
//         console.log('Called free from:\n' + Thread.backtrace(this.context, Backtracer.FUZZY).map(DebugSymbol.fromAddress).join('\n') + '\n');
//     }
// });


// CWnd::MessageBoxW
// Interceptor.attach(ptr(0x448C59), {
//     onEnter: function(args) {
//         console.log('MessageBox text is:', args[1].readUtf16String());
//         console.log('Called MessageBoxW from:\n' + Thread.backtrace(this.context, Backtracer.FUZZY).map(DebugSymbol.fromAddress).join('\n') + '\n');
//     }
// });

// Hook CClientSocket::WriteToBuffer
Interceptor.attach(ptr(0x402D40), {
    onEnter: function(args) {
        const pSocket = args[0].toInt32();
        const pSize = args[1].toInt32();
        const pBuffer = args[2];

        console.log(`> CClientSocket::WriteToBuffer(${pSocket}, ${pBuffer}, ${pSize})`);
        
        try {
            console.log(hexdump(pBuffer, { length: pSize }));
        } catch (error) {
            
        }

        // console.log('Called from:\n' + Thread.backtrace(this.context, Backtracer.FUZZY).map(DebugSymbol.fromAddress).join('\n') + '\n');
    }
});

// Hook HandlePacket at 0x446420
Interceptor.attach(ptr(0x446420), {
    onEnter: function(args) {
        const pSocket = args[0];
        const pUk1 = args[1];
        const pUk2 = args[2];

        console.log(`> HandlePacket(${pSocket}, ${pUk1}, ${pUk2})`);
    },
    onLeave: function(retval) {
        console.log(`HandlePacket retval: ${retval}`);
    }
});

// Hook memcpy at 46C530
Interceptor.attach(ptr(0x46C530), {
    onEnter: function(args) {
        const pDest = args[0];
        const pSrc = args[1];
        const size = args[2].toInt32();

        console.log(`> memcpy(${pDest}, ${pSrc}, ${size})`);
        console.log(hexdump(pSrc, { length: size }));
        console.log('Called from:\n' + Thread.backtrace(this.context, Backtracer.FUZZY).map(DebugSymbol.fromAddress).join('\n') + '\n');
    }
});