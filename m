From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92297] dithering detected incorrectly
Date: Mon, 05 Oct 2015 21:50:02 +0000
Message-ID: <bug-92297-8800-dJW8JdMNIa@http.bugs.freedesktop.org/>
References: <bug-92297-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0930407025=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92297-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0930407025==
Content-Type: multipart/alternative; boundary="1444081802.BCDFCb2.22233"; charset="UTF-8"


--1444081802.BCDFCb2.22233
Date: Mon, 5 Oct 2015 21:50:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92297

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Well, unless I'm misreading the bios (entirely possible), the FP data pointed
to by the offset in BIT table 'L' suggests that it's not a 8bpc screen.

bios->fp.strapless_is_24bit = bios->data[bios->fp.lvdsmanufacturerpointer + 4];

lvdsmanufacturerpointer = 56df

and 0x56e3 == 0. So nouveau is correctly turning on dithering based on the
information available to it. However perhaps that information isn't trustworthy
for fermi+. Or perhaps there's another bit somewhere.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1444081802.BCDFCb2.22233
Date: Mon, 5 Oct 2015 21:50:02 +0000
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
   title="NEW - dithering detected incorrectly"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92297#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - dithering detected incorrectly"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92297">bug 92297</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Well, unless I'm misreading the bios (entirely possible), the FP data pointed
to by the offset in BIT table 'L' suggests that it's not a 8bpc screen.

bios-&gt;fp.strapless_is_24bit = bios-&gt;data[bios-&gt;fp.lvdsmanufacturerpointer + 4];

lvdsmanufacturerpointer = 56df

and 0x56e3 == 0. So nouveau is correctly turning on dithering based on the
information available to it. However perhaps that information isn't trustworthy
for fermi+. Or perhaps there's another bit somewhere.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444081802.BCDFCb2.22233--

--===============0930407025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0930407025==--
