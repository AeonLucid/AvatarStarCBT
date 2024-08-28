// Hook GetStartupInfoW.
const GetStartupInfoW = Module.findExportByName('kernel32.dll', 'GetStartupInfoW')!;
const GetStartupInfoWHook = Interceptor.attach(GetStartupInfoW, {
    onEnter: function(args) {
        console.log('Called OEP.');

        GetStartupInfoWHook.detach();
    
        main();
    }
});

// Main
function main() {
    const baseAddress = Module.getBaseAddress('client.exe');

    // lua_load
    // Interceptor.attach(ptr(0x402400), {
    //     onEnter: function(args) {
    //         const pState = args[0];
    //         const pReader = args[1];
    //         const pData = args[2];
    //         const pChunkName = args[3].readCString();

    //         console.log(`[-] lua_load(${pState}, ${pReader}, ${pData}, ${pChunkName})`);
    //     }
    // });

    // luaL_loadbuffer
    // Interceptor.attach(ptr(0x403730), {
    //     onEnter: function(args) {
    //         const pState = args[0];
    //         const pBuffer = args[1];
    //         const pSize = args[2].toInt32();
    //         const pName = args[3].readCString();

    //         console.log(`[-] luaL_loadbuffer(${pState}, ${pBuffer}, ${pSize}, ${pName})`);
            
    //         // if (pSize === 250291) {
    //         //     console.log(hexdump(pBuffer, { length: pSize }));
    //         // }
    //     }
    // });

    // // lua LoadCode
    // Interceptor.attach(ptr(0x4187C0), {
    //     onEnter: function(args) {
    //         const cpu = this.context as Ia32CpuContext;
    //         const pState = cpu.eax;
    //         const pStateZ = pState.add(4).readPointer();

    //         console.log(`- S->Z->n = ${pStateZ.readU32()}`);
    //         console.log(`- S->Z->p = ${pStateZ.add(4).readU32()}`);

    //         // lua LoadInt
    //         const LoadIntHook = Interceptor.attach(ptr(0x418650), {
    //             onLeave: function(retval) {
    //                 LoadIntHook.detach();
    //                 console.log(`- Code size ${retval.toInt32()} (${retval})`);
    //             }
    //         });
    //     }
    // })

    // // lua LoadConstants
    // Interceptor.attach(ptr(0x418840), {
    //     onEnter: function(args) {
    //         const cpu = this.context as Ia32CpuContext;
    //         const pState = cpu.eax;
    //         const pStateZ = pState.add(4).readPointer();

    //         console.log(`- S->Z->n = ${pStateZ.readU32()}`);
    //         console.log(`- S->Z->p = ${pStateZ.add(4).readU32()}`);

    //         // lua LoadInt
    //         const LoadIntHook = Interceptor.attach(ptr(0x418650), {
    //             onLeave: function(retval) {
    //                 LoadIntHook.detach();
    //                 console.log(`- Constants size ${retval.toInt32()} (${retval})`);
    //             }
    //         });
    //     }
    // })

    // lua LoadFunction
    // Interceptor.attach(ptr(0x418E60), {
    //     onEnter: function(args) {
    //         const pState = args[0];
    //         const pStr = args[1];

    //         const pStateZ = pState.add(4).readPointer();

    //         console.log(`[-] lua LoadFunction(${pStateZ}, ${pStr})`);
    //         console.log(`- S->Z->n = ${pStateZ.readU32()}`);
    //         console.log(`- S->Z->p = ${pStateZ.add(4).readU32()}`);

    //         this.pStateZ = pStateZ;
    //     },
    //     onLeave: function(retval) {
    //         console.log(`- Return: ${retval}`);
    //         console.log(`- S->Z->n = ${this.pStateZ.readU32()}`);
    //         console.log(`- S->Z->p = ${this.pStateZ.add(4).readU32()}`);
    //     }
    // });
    
    // Hook win32 function to copy memory
    // const RtlCopyMemory = Module.findExportByName('ntdll.dll', 'RtlCopyMemory')!;

    // Interceptor.attach(RtlCopyMemory, {
    //     onEnter: function(args) {
    //         console.log('Called RtlCopyMemory.', args[0], args[1], args[2]);
    //         console.log(hexdump(args[0], { length: 16 }));
    //         console.log(hexdump(args[1], { length: 16 }));
    //         console.log(hexdump(args[2], { length: 16 }));
    //     }
    // })

    const ws32Connect = Module.findExportByName('ws2_32.dll', 'connect');
    const ws32Send = Module.findExportByName('ws2_32.dll', 'send');
    const ws32SendTo = Module.findExportByName('ws2_32.dll', 'sendto');

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

    // Interceptor.replace(ptr(0x4D1100), new NativeCallback(function(thiz: NativePointer) {
    //     console.log('Called thing', thiz);
    // }, 'void', ['pointer']));

    // Hook memcpy
    // Interceptor.attach(ptr(0xB03E40), {
    //     onEnter: function(args) {
    //         const dest = args[0];
    //         const src = args[1];
    //         const size = args[2].toInt32();

    //         console.log('Called memcpy.', dest, src, size);
    //         console.log(hexdump(src, { length: size }));
    //         console.log('Called memcpy from:\n' + Thread.backtrace(this.context, Backtracer.FUZZY).map(DebugSymbol.fromAddress).join('\n') + '\n');
    //     }
    // });

    // Logging 0x4CF640 sub_4CF640(&dword_E9A4B8, aIpSPortDKey1D, ArgList[0]);

    // Interceptor.attach(ptr(0x4CF640), {
    //     onEnter: function(args) {
    //         const pArg0 = args[0];
    //         const pArg1 = args[1].readCString();
    //         const pArg2 = args[2].readCString();

    //         console.log(`sub_4CF640(${pArg0}, "${pArg1}", ${pArg2})`);
    //     }
    // });

    /**
     * Debug memory access
     */
    Interceptor.attach(ptr(0x844980), {
        onEnter: function(args) {
            const cpu = this.context as Ia32CpuContext;
            console.log(`[-] ClientLobbyConnection::Construct(${cpu.ecx})`);
        }
    });

    Interceptor.attach(ptr(0x4D1620), {
        onEnter: function(args) {
            const cpu = this.context as Ia32CpuContext;
            console.log(`[-] Core::BinaryNetworkStream::Construct(${cpu.ecx})`);
        }
    });

    Interceptor.attach(ptr(0x4D1FC0), {
        onEnter: function(args) {
            const cpu = this.context as Ia32CpuContext;
            console.log(`[-] Core::TcpConnection::Construct(${cpu.ecx})`);
        }
    });

    Interceptor.attach(ptr(0x4D1670), {
        onEnter: function(args) {
            const cpu = this.context as Ia32CpuContext;
            console.log(`[-] Core::BinaryNetworkStream::Unknown(${cpu.ecx})`);
        }
    });

    Interceptor.attach(ptr(0x846890), {
        onEnter: function(args) {
            const cpu = this.context as Ia32CpuContext;
            console.log(`[-] Core::LobbyConnectionStream::HandlePacket(${cpu.ecx})`);
            console.log('this + 0x800044 =', cpu.ecx.add(0x800044));
            // console.log(hexdump(cpu.ecx.add(0x800044), { length: 32 }));
            console.log('Called from:\n' + Thread.backtrace(this.context, Backtracer.FUZZY).map(DebugSymbol.fromAddress).join('\n') + '\n');
        }
    });
}