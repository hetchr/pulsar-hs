#include "/nix/store/70j3l8mn4r6hsi4dshpl4cdbbcrgb3xl-hsc2hs-0.68.7-data/share/ghc-8.10.7/x86_64-linux-ghc-8.10.7/hsc2hs-0.68.7/template-hsc.h"
#line 2 "Authentication.hsc"
#include <bindings.dsl.h>
#line 3 "Authentication.hsc"
#include <pulsar/c/authentication.h>

int main (void)
{
    hsc_line (1, "src/Pulsar/Client/Internal/Foreign/Authentication.hsc");
    hsc_fputs ("", hsc_stdout());
    hsc_fputs ("{-# OPTIONS_GHC -fno-warn-unused-imports #-}\n"
           "", hsc_stdout());
    hsc_fputs ("", hsc_stdout());
    hsc_fputs ("\n"
           "", hsc_stdout());
    hsc_fputs ("", hsc_stdout());
    hsc_fputs ("\n"
           "", hsc_stdout());
    hsc_fputs ("module Pulsar.Client.Internal.Foreign.Authentication where\n"
           "import Foreign.Ptr\n"
           "", hsc_stdout());
#line 6 "Authentication.hsc"
    hsc_strict_import ();
    hsc_fputs ("\n"
           "", hsc_stdout());
    hsc_line (7, "src/Pulsar/Client/Internal/Foreign/Authentication.hsc");
    hsc_fputs ("\n"
           "{- typedef struct _pulsar_authentication pulsar_authentication_t; -}\n"
           "", hsc_stdout());
#line 9 "Authentication.hsc"
    hsc_opaque_t (struct _pulsar_authentication);
    hsc_fputs ("\n"
           "", hsc_stdout());
    hsc_line (10, "src/Pulsar/Client/Internal/Foreign/Authentication.hsc");
    hsc_fputs ("", hsc_stdout());
#line 10 "Authentication.hsc"
    hsc_synonym_t (pulsar_authentication_t , <struct _pulsar_authentication>);
    hsc_fputs ("\n"
           "", hsc_stdout());
    hsc_line (11, "src/Pulsar/Client/Internal/Foreign/Authentication.hsc");
    hsc_fputs ("", hsc_stdout());
#line 11 "Authentication.hsc"
    hsc_callback (token_supplier , Ptr () -> IO CString);
    hsc_fputs ("\n"
           "", hsc_stdout());
    hsc_line (12, "src/Pulsar/Client/Internal/Foreign/Authentication.hsc");
    hsc_fputs ("", hsc_stdout());
#line 12 "Authentication.hsc"
    hsc_ccall (pulsar_authentication_create , CString -> CString -> IO (Ptr <struct _pulsar_authentication>));
    hsc_fputs ("\n"
           "", hsc_stdout());
    hsc_line (13, "src/Pulsar/Client/Internal/Foreign/Authentication.hsc");
    hsc_fputs ("", hsc_stdout());
#line 13 "Authentication.hsc"
    hsc_ccall (pulsar_authentication_tls_create , CString -> CString -> IO (Ptr <struct _pulsar_authentication>));
    hsc_fputs ("\n"
           "", hsc_stdout());
    hsc_line (14, "src/Pulsar/Client/Internal/Foreign/Authentication.hsc");
    hsc_fputs ("", hsc_stdout());
#line 14 "Authentication.hsc"
    hsc_ccall (pulsar_authentication_token_create , CString -> IO (Ptr <struct _pulsar_authentication>));
    hsc_fputs ("\n"
           "", hsc_stdout());
    hsc_line (15, "src/Pulsar/Client/Internal/Foreign/Authentication.hsc");
    hsc_fputs ("", hsc_stdout());
#line 15 "Authentication.hsc"
    hsc_ccall (pulsar_authentication_token_create_with_supplier , <token_supplier> -> Ptr () -> IO (Ptr <struct _pulsar_authentication>));
    hsc_fputs ("\n"
           "", hsc_stdout());
    hsc_line (16, "src/Pulsar/Client/Internal/Foreign/Authentication.hsc");
    hsc_fputs ("", hsc_stdout());
#line 16 "Authentication.hsc"
    hsc_ccall (pulsar_authentication_athenz_create , CString -> IO (Ptr <struct _pulsar_authentication>));
    hsc_fputs ("\n"
           "", hsc_stdout());
    hsc_line (17, "src/Pulsar/Client/Internal/Foreign/Authentication.hsc");
    hsc_fputs ("", hsc_stdout());
#line 17 "Authentication.hsc"
    hsc_ccall (pulsar_authentication_oauth2_create , CString -> IO (Ptr <struct _pulsar_authentication>));
    hsc_fputs ("\n"
           "", hsc_stdout());
    hsc_line (18, "src/Pulsar/Client/Internal/Foreign/Authentication.hsc");
    hsc_fputs ("", hsc_stdout());
#line 18 "Authentication.hsc"
    hsc_ccall (pulsar_authentication_free , Ptr <struct _pulsar_authentication> -> IO ());
    hsc_fputs ("\n"
           "", hsc_stdout());
    hsc_line (19, "src/Pulsar/Client/Internal/Foreign/Authentication.hsc");
    hsc_fputs ("", hsc_stdout());
    return 0;
}
