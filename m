From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91779] Pure EFI: MacBookPro3,
 1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents
Date: Sat, 29 Aug 2015 16:13:28 +0000
Message-ID: <bug-91779-8800-1ic69oH7oJ@http.bugs.freedesktop.org/>
References: <bug-91779-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1091401164=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91779-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1091401164==
Content-Type: multipart/alternative; boundary="1440864808.afb51.10085"; charset="UTF-8"


--1440864808.afb51.10085
Date: Sat, 29 Aug 2015 16:13:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91779

--- Comment #5 from Jeremy Huddleston <jeremyhu-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> ---
Thanks Ilia,

I think the most pressing issue here is to get users a working fb when they
boot in such a configuration (eg: Ubuntu's and Fedora's recent live cds).  Can
we use this bug to track updating the nouveau kernel module to not take away
the fb until it has guaranteed that it can be used for the fb?

Currently, forums are filled with recommendations that users boot with
nomodeset, which acts as a workaround because nouveau errs out earlier if KMS
is disabled.  It would be good to ensure that this error is similarly handled
early so as to not leave the user without an fb.


As an aside, I reconfigured for BIOS-emulation and have nouveau loading fine
here.  I'd like to get back to pure EFI, so is there an easy way to have
nouveau dump the firmware to disk for my use in EFI mode?  Is it exported in
/sys somewhere?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1440864808.afb51.10085
Date: Sat, 29 Aug 2015 16:13:28 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Pure EFI: MacBookPro3,1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91779#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Pure EFI: MacBookPro3,1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91779">bug 91779</a>
              from <span class="vcard"><a class="email" href="mailto:jeremyhu&#64;freedesktop.org" title="Jeremy Huddleston &lt;jeremyhu&#64;freedesktop.org&gt;"> <span class="fn">Jeremy Huddleston</span></a>
</span></b>
        <pre>Thanks Ilia,

I think the most pressing issue here is to get users a working fb when they
boot in such a configuration (eg: Ubuntu's and Fedora's recent live cds).  Can
we use this bug to track updating the nouveau kernel module to not take away
the fb until it has guaranteed that it can be used for the fb?

Currently, forums are filled with recommendations that users boot with
nomodeset, which acts as a workaround because nouveau errs out earlier if KMS
is disabled.  It would be good to ensure that this error is similarly handled
early so as to not leave the user without an fb.


As an aside, I reconfigured for BIOS-emulation and have nouveau loading fine
here.  I'd like to get back to pure EFI, so is there an easy way to have
nouveau dump the firmware to disk for my use in EFI mode?  Is it exported in
/sys somewhere?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1440864808.afb51.10085--

--===============1091401164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1091401164==--
