From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61321] [regression][NV4c] System hang while loading
 gdm on 3.7 kernel (works on 3.6)
Date: Sat, 23 Feb 2013 00:21:38 +0000
Message-ID: <bug-61321-8800-MWNv09DbjL@http.bugs.freedesktop.org/>
References: <bug-61321-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0107987062=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61321-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0107987062==
Content-Type: multipart/alternative; boundary="1361578898.3AafdfaE1.6752"; charset="us-ascii"


--1361578898.3AafdfaE1.6752
Date: Sat, 23 Feb 2013 00:21:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61321

--- Comment #2 from Cesar Eduardo Barros <cesarb-PWySMVKUnqmsTnJN9+BGXg@public.gmane.org> ---
Created attachment 75391
  --> https://bugs.freedesktop.org/attachment.cgi?id=75391&action=edit
Second part of attempt with 3.7.9

Second part of attempt with the 3.7.9 kernel, captured with netconsole before
and during systemd isolate of graphical.target

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361578898.3AafdfaE1.6752
Date: Sat, 23 Feb 2013 00:21:38 +0000
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
   title="NEW --- - [regression][NV4c] System hang while loading gdm on 3.7 kernel (works on 3.6)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61321#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression][NV4c] System hang while loading gdm on 3.7 kernel (works on 3.6)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61321">bug 61321</a>
              from <span class="vcard"><a class="email" href="mailto:cesarb&#64;cesarb.net" title="Cesar Eduardo Barros &lt;cesarb&#64;cesarb.net&gt;"> <span class="fn">Cesar Eduardo Barros</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=75391" name="attach_75391" title="Second part of attempt with 3.7.9">attachment 75391</a> <a href="attachment.cgi?id=75391&amp;action=edit" title="Second part of attempt with 3.7.9">[details]</a></span>
Second part of attempt with 3.7.9

Second part of attempt with the 3.7.9 kernel, captured with netconsole before
and during systemd isolate of graphical.target</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361578898.3AafdfaE1.6752--

--===============0107987062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0107987062==--
