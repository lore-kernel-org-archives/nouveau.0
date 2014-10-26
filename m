From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85160] [NV94] INVALID_STATE error,
 X fails to start on GeForce 9600 GT with dual monitors,
 kernels 3.18.0-0.rc0.git8.2.fc22.1 onwards
Date: Sun, 26 Oct 2014 04:08:37 +0000
Message-ID: <bug-85160-8800-8pnIeSUEjg@http.bugs.freedesktop.org/>
References: <bug-85160-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0586863859=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-85160-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0586863859==
Content-Type: multipart/alternative; boundary="1414296518.0e0b2.25931"; charset="UTF-8"


--1414296518.0e0b2.25931
Date: Sun, 26 Oct 2014 04:08:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85160

--- Comment #5 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 108425
  --> https://bugs.freedesktop.org/attachment.cgi?id=108425&action=edit
Revert "drm/nv50/kms: Set VBLANK time in modeset script" - git 1dce626


Ilia an Mr. user, thanks. :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1414296518.0e0b2.25931
Date: Sun, 26 Oct 2014 04:08:38 +0000
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
   title="NEW - [NV94] INVALID_STATE error, X fails to start on GeForce 9600 GT with dual monitors, kernels 3.18.0-0.rc0.git8.2.fc22.1 onwards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85160#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] INVALID_STATE error, X fails to start on GeForce 9600 GT with dual monitors, kernels 3.18.0-0.rc0.git8.2.fc22.1 onwards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85160">bug 85160</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=108425" name="attach_108425" title="Revert &quot;drm/nv50/kms: Set VBLANK time in modeset script&quot; - git 1dce626">attachment 108425</a> <a href="attachment.cgi?id=108425&amp;action=edit" title="Revert &quot;drm/nv50/kms: Set VBLANK time in modeset script&quot; - git 1dce626">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=85160&amp;attachment=108425'>[review]</a>
Revert &quot;drm/nv50/kms: Set VBLANK time in modeset script&quot; - git 1dce626


Ilia an Mr. user, thanks. :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414296518.0e0b2.25931--

--===============0586863859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0586863859==--
