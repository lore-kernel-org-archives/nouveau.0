From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91779] Pure EFI: MacBookPro3,
 1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents
Date: Sat, 29 Aug 2015 16:41:12 +0000
Message-ID: <bug-91779-8800-XyjynVwPZU@http.bugs.freedesktop.org/>
References: <bug-91779-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0251741771=="
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


--===============0251741771==
Content-Type: multipart/alternative; boundary="1440866472.B3612D02.17622"; charset="UTF-8"


--1440866472.B3612D02.17622
Date: Sat, 29 Aug 2015 16:41:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91779

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Jeremy Huddleston from comment #5)
> Thanks Ilia,
> 
> I think the most pressing issue here is to get users a working fb when they
> boot in such a configuration (eg: Ubuntu's and Fedora's recent live cds). 
> Can we use this bug to track updating the nouveau kernel module to not take
> away the fb until it has guaranteed that it can be used for the fb?

Bug id's are cheap, I'd file a new one, but that's me. If you feel like the
quantity of integers is quickly running out, feel free to reuse this one, just
update the subject.

> As an aside, I reconfigured for BIOS-emulation and have nouveau loading fine
> here.  I'd like to get back to pure EFI, so is there an easy way to have
> nouveau dump the firmware to disk for my use in EFI mode?  Is it exported in
> /sys somewhere?

/sys/kernel/debug/dri/0/vbios.rom

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1440866472.B3612D02.17622
Date: Sat, 29 Aug 2015 16:41:12 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91779#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Pure EFI: MacBookPro3,1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91779">bug 91779</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Jeremy Huddleston from <a href="show_bug.cgi?id=91779#c5">comment #5</a>)
<span class="quote">&gt; Thanks Ilia,
&gt; 
&gt; I think the most pressing issue here is to get users a working fb when they
&gt; boot in such a configuration (eg: Ubuntu's and Fedora's recent live cds). 
&gt; Can we use this bug to track updating the nouveau kernel module to not take
&gt; away the fb until it has guaranteed that it can be used for the fb?</span >

Bug id's are cheap, I'd file a new one, but that's me. If you feel like the
quantity of integers is quickly running out, feel free to reuse this one, just
update the subject.

<span class="quote">&gt; As an aside, I reconfigured for BIOS-emulation and have nouveau loading fine
&gt; here.  I'd like to get back to pure EFI, so is there an easy way to have
&gt; nouveau dump the firmware to disk for my use in EFI mode?  Is it exported in
&gt; /sys somewhere?</span >

/sys/kernel/debug/dri/0/vbios.rom</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1440866472.B3612D02.17622--

--===============0251741771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0251741771==--
