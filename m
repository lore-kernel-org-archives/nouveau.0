From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89730] NV50: LightDM GTK+ Greeter Background -
 inconsistent display
Date: Mon, 30 Mar 2015 06:10:58 +0000
Message-ID: <bug-89730-8800-sM75kjbiSs@http.bugs.freedesktop.org/>
References: <bug-89730-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0801901539=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89730-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0801901539==
Content-Type: multipart/alternative; boundary="1427695857.bCcd1.403"; charset="UTF-8"


--1427695857.bCcd1.403
Date: Mon, 30 Mar 2015 06:10:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89730

--- Comment #16 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

Within nv50_exa.c, regardless of the function or statement FALLBACK-ed,
commented or deleted, at best, the effect is the same as with disabling EXA
Composite.

It has a positive effect on Greeter Background image loading,
BUT produce at least corruption of some of the icons within Desktop session.


Section "Device"
    Identifier "video0"
    Driver     "nouveau"
    Option     "EXANoComposite" "Yes"
EndSection


[8.266] (II) Loading sub module "exa"
[8.266] (II) LoadModule: "exa"
[8.266] (II) Loading /usr/lib64/xorg/modules/libexa.so
[8.266] (II) Module exa: vendor="X.Org Foundation"
[8.266] (**) NOUVEAU(0): Option "EXANoComposite" "Yes"
[8.266] (**) NOUVEAU(0): EXA: Disabling Composite operation (RENDER
acceleration)
[8.266] (II) EXA(0): Driver allocated offscreen pixmaps
[8.266] (II) EXA(0): Driver registered support for the following operations:
[8.266] (II)         Solid
[8.266] (II)         Copy
[8.266] (II)         UploadToScreen
[8.266] (II)         DownloadFromScreen


Disables acceleration of the Composite operation,
which is at the heart of the Render extension.
Not related to the Composite extension.
Default: No.

man 4 exa

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427695857.bCcd1.403
Date: Mon, 30 Mar 2015 06:10:57 +0000
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
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730">bug 89730</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
Within nv50_exa.c, regardless of the function or statement FALLBACK-ed,
commented or deleted, at best, the effect is the same as with disabling EXA
Composite.

It has a positive effect on Greeter Background image loading,
BUT produce at least corruption of some of the icons within Desktop session.


Section &quot;Device&quot;
    Identifier &quot;video0&quot;
    Driver     &quot;nouveau&quot;
    Option     &quot;EXANoComposite&quot; &quot;Yes&quot;
EndSection


[8.266] (II) Loading sub module &quot;exa&quot;
[8.266] (II) LoadModule: &quot;exa&quot;
[8.266] (II) Loading /usr/lib64/xorg/modules/libexa.so
[8.266] (II) Module exa: vendor=&quot;X.Org Foundation&quot;
[8.266] (**) NOUVEAU(0): Option &quot;EXANoComposite&quot; &quot;Yes&quot;
[8.266] (**) NOUVEAU(0): EXA: Disabling Composite operation (RENDER
acceleration)
[8.266] (II) EXA(0): Driver allocated offscreen pixmaps
[8.266] (II) EXA(0): Driver registered support for the following operations:
[8.266] (II)         Solid
[8.266] (II)         Copy
[8.266] (II)         UploadToScreen
[8.266] (II)         DownloadFromScreen


Disables acceleration of the Composite operation,
which is at the heart of the Render extension.
Not related to the Composite extension.
Default: No.

man 4 exa</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427695857.bCcd1.403--

--===============0801901539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0801901539==--
