From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59057] Black screen after resume from s2ram
Date: Tue, 26 Feb 2013 11:38:14 +0000
Message-ID: <bug-59057-8800-lYW0jmwoBq@http.bugs.freedesktop.org/>
References: <bug-59057-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1485843421=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59057-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1485843421==
Content-Type: multipart/alternative; boundary="1361878694.5024BEfA4.16446"; charset="us-ascii"


--1361878694.5024BEfA4.16446
Date: Tue, 26 Feb 2013 11:38:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59057

--- Comment #33 from J Binder <wheel-pGoT+mvyLdp4LYgiJMQgWbNAH6kLmebB@public.gmane.org> ---
commit e5a58edc94a20a7ef4b7db67c166c4ca0588bad0
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Sat Feb 16 13:49:21 2013 +1000

    drm/nv50-/disp: 0x0000 is a valid udisp config value

    Return an out-of-range value instead to signal a failure from
    exec_clkcmp().

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>


is the first commit where s2ram works for me.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361878694.5024BEfA4.16446
Date: Tue, 26 Feb 2013 11:38:14 +0000
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
   title="NEW --- - Black screen after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59057#c33">Comment # 33</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Black screen after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59057">bug 59057</a>
              from <span class="vcard"><a class="email" href="mailto:wheel&#64;herr-der-mails.de" title="J Binder &lt;wheel&#64;herr-der-mails.de&gt;"> <span class="fn">J Binder</span></a>
</span></b>
        <pre>commit e5a58edc94a20a7ef4b7db67c166c4ca0588bad0
Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
Date:   Sat Feb 16 13:49:21 2013 +1000

    drm/nv50-/disp: 0x0000 is a valid udisp config value

    Return an out-of-range value instead to signal a failure from
    exec_clkcmp().

    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;


is the first commit where s2ram works for me.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361878694.5024BEfA4.16446--

--===============1485843421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1485843421==--
