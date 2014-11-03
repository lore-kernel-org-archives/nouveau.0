From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84706] [NV94] HDMI Connected,
	but TV reports "no signal"
Date: Mon, 03 Nov 2014 20:49:32 +0000
Message-ID: <bug-84706-8800-DjhocGMunW@http.bugs.freedesktop.org/>
References: <bug-84706-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0550922204=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-84706-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0550922204==
Content-Type: multipart/alternative; boundary="1415047771.D2e3ed1.22062"; charset="UTF-8"


--1415047771.D2e3ed1.22062
Date: Mon, 3 Nov 2014 20:49:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84706

--- Comment #14 from Jay van Dam <jayvandam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Recompiled the kernel without vesa and uvesa, but it does not make a
difference.  Added the new kernel log with nouveau.debug=trace and
drm.debug=0xe. Also added the Xorg.log and the xrandr output. 

When I went through the kernel log I saw the following lines passing by:
[    0.385140] nouveau D[  DEVICE][0000:05:00.0][0x80000080][ffff880222262600]
illegal class 0x9470
[    0.385151] nouveau D[  DEVICE][0000:05:00.0][0x80000080][ffff880222262600]
handle 0xd1500000 not found


[    0.392674] nouveau D[   PDISP][0000:05:00.0][0x80008870][ffff8800cb36a120]
illegal class 0x947d

[    0.392686] nouveau D[   PDISP][0000:05:00.0][0x80008870][ffff8800cb36a120]
handle 0x947d0000 not found

[    0.654992] nouveau D[   PFIFO][0000:05:00.0][0xc000826f][ffff880222d533c0]
illegal class 0xa0b5
[    0.655005] nouveau D[   PFIFO][0000:05:00.0][0xc000826f][ffff880222d533c0]
handle 0x0000a0b5 not found

The messages "illegal class" and "handle not found" do not seem right. Could
this be related?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1415047771.D2e3ed1.22062
Date: Mon, 3 Nov 2014 20:49:31 +0000
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
   title="NEW - [NV94] HDMI Connected, but TV reports &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84706#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] HDMI Connected, but TV reports &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84706">bug 84706</a>
              from <span class="vcard"><a class="email" href="mailto:jayvandam&#64;gmail.com" title="Jay van Dam &lt;jayvandam&#64;gmail.com&gt;"> <span class="fn">Jay van Dam</span></a>
</span></b>
        <pre>Recompiled the kernel without vesa and uvesa, but it does not make a
difference.  Added the new kernel log with nouveau.debug=trace and
drm.debug=0xe. Also added the Xorg.log and the xrandr output. 

When I went through the kernel log I saw the following lines passing by:
[    0.385140] nouveau D[  DEVICE][0000:05:00.0][0x80000080][ffff880222262600]
illegal class 0x9470
[    0.385151] nouveau D[  DEVICE][0000:05:00.0][0x80000080][ffff880222262600]
handle 0xd1500000 not found


[    0.392674] nouveau D[   PDISP][0000:05:00.0][0x80008870][ffff8800cb36a120]
illegal class 0x947d

[    0.392686] nouveau D[   PDISP][0000:05:00.0][0x80008870][ffff8800cb36a120]
handle 0x947d0000 not found

[    0.654992] nouveau D[   PFIFO][0000:05:00.0][0xc000826f][ffff880222d533c0]
illegal class 0xa0b5
[    0.655005] nouveau D[   PFIFO][0000:05:00.0][0xc000826f][ffff880222d533c0]
handle 0x0000a0b5 not found

The messages &quot;illegal class&quot; and &quot;handle not found&quot; do not seem right. Could
this be related?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1415047771.D2e3ed1.22062--

--===============0550922204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0550922204==--
