# AvatarStarCBT

This is a work in progress private server for the game Avatar Star.  
The version targeted is a closed beta test held in 2013.

## Notes

### Lua differences

The lua scripts are written using an alpha version of Lua `5.2`. This is why the lua files still have a `5.1` header.  

lua commit https://github.com/lua/lua/tree/193ce46970dda16e129ebb28cae085ecf469d702  
luac commit https://github.com/lua/luac/tree/79e59651d71d5748d911959749d0bbc05fd99c88

### Unpack client.exe

The main client executable is packed by Apex Protect, to unpack place a breakpoint on `0x0116606D jmp eax`.  
Here `eax` holds the original entrypoint (OEP), which is `0x00B068B5`.  
Dump the executable from memory, and fix the dump with scylla using these settings.

```
OEP  00B068B5
VA   00B9A000
Size 000004E0
```

### Disable anti cheat

The game has an anti cheat named avital / apex protect.  
You need to disable it by replacing `E8 9E 1E 00 00` with `90 90 90 90 90` inside `client.exe`.  

## Why

I don't know.
