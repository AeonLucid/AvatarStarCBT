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
    Interceptor.attach(ptr(0x403730), {
        onEnter: function(args) {
            const pState = args[0];
            const pBuffer = args[1];
            const pSize = args[2].toInt32();
            const pName = args[3].readCString();

            console.log(`[-] luaL_loadbuffer(${pState}, ${pBuffer}, ${pSize}, ${pName})`);
            
            // if (pSize === 331) {
            //     console.log(hexdump(pBuffer, { length: pSize }));
            // }
        }
    });

    // lua LoadFunction
    Interceptor.attach(ptr(0x418E60), {
        onEnter: function(args) {
            const pState = args[0];
            const pStr = args[1];

            const pStateZ = pState.add(4).readPointer();

            console.log(`[-] lua LoadFunction(${pStateZ}, ${pStr})`);
            console.log(`- S->Z->n = ${pStateZ.readU32()}`);
            console.log(`- S->Z->p = ${pStateZ.add(4).readU32()}`);

            this.pStateZ = pStateZ;
        },
        onLeave: function(retval) {
            console.log(`- Return: ${retval}`);
            console.log(`- S->Z->n = ${this.pStateZ.readU32()}`);
            console.log(`- S->Z->p = ${this.pStateZ.add(4).readU32()}`);
        }
    });
    
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
}