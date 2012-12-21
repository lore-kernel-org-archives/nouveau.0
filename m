From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58615] nv43 hangs with direct rendering since 3.7
	rework
Date: Fri, 21 Dec 2012 12:32:21 +0000
Message-ID: <bug-58615-8800-in10ef3BCm@http.bugs.freedesktop.org/>
References: <bug-58615-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1050454010=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58615-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1050454010==
Content-Type: multipart/alternative; boundary="1356093142.Da83381.14264"; charset="us-ascii"


--1356093142.Da83381.14264
Date: Fri, 21 Dec 2012 12:32:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58615

--- Comment #4 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org> ---
Created attachment 71923
  --> https://bugs.freedesktop.org/attachment.cgi?id=71923&action=edit
working  X  log

This is  on kernel 3.6.11. 

bash-4.2$ glxgears
Running synchronized to the vertical refresh.  The framerate should be
approximately the same as the monitor refresh rate.
809 frames in 5.0 seconds = 161.695 FPS
1080 frames in 5.0 seconds = 215.978 FPS
997 frames in 5.0 seconds = 199.132 FPS
951 frames in 5.0 seconds = 189.950 FPS
988 frames in 5.0 seconds = 197.346 FPS
XIO:  fatal IO error 11 (Resource temporarily unavailable) on X server ":0"
      after 16815 requests (16815 known processed) with 0 events remaining.
bash-4.2$

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1356093142.Da83381.14264
Date: Fri, 21 Dec 2012 12:32:22 +0000
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
   title="NEW --- - nv43 hangs with direct rendering since 3.7 rework"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58615#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nv43 hangs with direct rendering since 3.7 rework"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58615">bug 58615</a>
              from <span class="vcard"><a class="email" href="mailto:randrik&#64;mail.ru" title="Andrew Randrianasulu &lt;randrik&#64;mail.ru&gt;"> <span class="fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=71923" name="attach_71923" title="working  X  log">attachment 71923</a> <a href="attachment.cgi?id=71923&amp;action=edit" title="working  X  log">[details]</a></span>
working  X  log

This is  on kernel 3.6.11. 

bash-4.2$ glxgears
Running synchronized to the vertical refresh.  The framerate should be
approximately the same as the monitor refresh rate.
809 frames in 5.0 seconds = 161.695 FPS
1080 frames in 5.0 seconds = 215.978 FPS
997 frames in 5.0 seconds = 199.132 FPS
951 frames in 5.0 seconds = 189.950 FPS
988 frames in 5.0 seconds = 197.346 FPS
XIO:  fatal IO error 11 (Resource temporarily unavailable) on X server &quot;:0&quot;
      after 16815 requests (16815 known processed) with 0 events remaining.
bash-4.2$</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356093142.Da83381.14264--

--===============1050454010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1050454010==--
