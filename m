From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91051] GT650M and Nouveau - NOUVEAU(0): [drm] failed
 to set drm interface version.
Date: Sat, 03 Oct 2015 07:34:57 +0000
Message-ID: <bug-91051-8800-7tchCcWlhH@http.bugs.freedesktop.org/>
References: <bug-91051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0508294221=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91051-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0508294221==
Content-Type: multipart/alternative; boundary="1443857697.2e4FCCDF0.13076"; charset="UTF-8"


--1443857697.2e4FCCDF0.13076
Date: Sat, 3 Oct 2015 07:34:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91051

--- Comment #15 from Stuart Axon <stu.axon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Changing the intel driver to use SNA seems to have fixed the black window
problem AND the glitchyness in glxdemo when using DRI_PRIME=1


I followed advice here
https://ask.fedoraproject.org/en/question/32960/black-windows-in-gnome-3-suddenly/

and set /etc/X11/xorg.conf to this below.

- anyone on optimnus having similar problems should probably try this.  - In
the meantime this bug can be closed.




Section "Device"
    Identifier "Intel Graphics"
    Driver "intel"
    Option "AccelMethod" "sna"
EndSection

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1443857697.2e4FCCDF0.13076
Date: Sat, 3 Oct 2015 07:34:57 +0000
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
   title="NEW - GT650M and Nouveau - NOUVEAU(0): [drm] failed to set drm interface version."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91051#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - GT650M and Nouveau - NOUVEAU(0): [drm] failed to set drm interface version."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91051">bug 91051</a>
              from <span class="vcard"><a class="email" href="mailto:stu.axon&#64;gmail.com" title="Stuart Axon &lt;stu.axon&#64;gmail.com&gt;"> <span class="fn">Stuart Axon</span></a>
</span></b>
        <pre>Changing the intel driver to use SNA seems to have fixed the black window
problem AND the glitchyness in glxdemo when using DRI_PRIME=1


I followed advice here
<a href="https://ask.fedoraproject.org/en/question/32960/black-windows-in-gnome-3-suddenly/">https://ask.fedoraproject.org/en/question/32960/black-windows-in-gnome-3-suddenly/</a>

and set /etc/X11/xorg.conf to this below.

- anyone on optimnus having similar problems should probably try this.  - In
the meantime this bug can be closed.




Section &quot;Device&quot;
    Identifier &quot;Intel Graphics&quot;
    Driver &quot;intel&quot;
    Option &quot;AccelMethod&quot; &quot;sna&quot;
EndSection</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1443857697.2e4FCCDF0.13076--

--===============0508294221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0508294221==--
