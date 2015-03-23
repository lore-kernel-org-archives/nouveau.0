From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89558] [NV118] GM108 not supported by nouveau
Date: Mon, 23 Mar 2015 17:03:41 +0000
Message-ID: <bug-89558-8800-RSjNNQmsFc@http.bugs.freedesktop.org/>
References: <bug-89558-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1049384759=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89558-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1049384759==
Content-Type: multipart/alternative; boundary="1427130222.aDb16f53.23205"; charset="UTF-8"


--1427130222.aDb16f53.23205
Date: Mon, 23 Mar 2015 17:03:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89558

--- Comment #15 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
[26833.396432] nouveau D[     PFB][0000:07:00.0] 0x100800: 0x00000001
[26833.396435] nouveau D[     PFB][0000:07:00.0] parts 0x00000001 mask
0x00000000
[26833.396447] nouveau E[    PBUS][0000:07:00.0] MMIO read of 0x00000000 FAULT
at 0x6013d4 [ IBUS ]
[26833.396448] nouveau D[     PFB][0000:07:00.0] 0: mem_amount 0xbadf3000

Both of you have basically the same thing. SMF: *please* stop filtering stuff
out... I know you think you're helping, but in reality, it just makes
everything more complicated.

The 0xbadf3000 is in response to the mmio error, but I'm a bit surprised that
it's getting read from that register... should have been 0x11020c. Very odd...
Perhaps the error decoding logic is off.

Either way, we'll need a mmiotrace to work this out.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427130222.aDb16f53.23205
Date: Mon, 23 Mar 2015 17:03:42 +0000
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
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558">bug 89558</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>[26833.396432] nouveau D[     PFB][0000:07:00.0] 0x100800: 0x00000001
[26833.396435] nouveau D[     PFB][0000:07:00.0] parts 0x00000001 mask
0x00000000
[26833.396447] nouveau E[    PBUS][0000:07:00.0] MMIO read of 0x00000000 FAULT
at 0x6013d4 [ IBUS ]
[26833.396448] nouveau D[     PFB][0000:07:00.0] 0: mem_amount 0xbadf3000

Both of you have basically the same thing. SMF: *please* stop filtering stuff
out... I know you think you're helping, but in reality, it just makes
everything more complicated.

The 0xbadf3000 is in response to the mmio error, but I'm a bit surprised that
it's getting read from that register... should have been 0x11020c. Very odd...
Perhaps the error decoding logic is off.

Either way, we'll need a mmiotrace to work this out.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427130222.aDb16f53.23205--

--===============1049384759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1049384759==--
