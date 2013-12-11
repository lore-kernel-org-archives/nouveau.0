From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72599] [NVC0] null pointer dereference
 (nouveau_fence_wait_uevent.isra.5)
Date: Wed, 11 Dec 2013 14:41:25 +0000
Message-ID: <bug-72599-8800-1UdOzx1e3B@http.bugs.freedesktop.org/>
References: <bug-72599-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1611396304=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72599-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1611396304==
Content-Type: multipart/alternative; boundary="1386772885.ddFDeCc1.5074"; charset="us-ascii"


--1386772885.ddFDeCc1.5074
Date: Wed, 11 Dec 2013 14:41:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72599

--- Comment #1 from Matthias Dahl <ua_bugzilla_freedesktop-EqN0DgjA0IPxpcmzjlbVsw@public.gmane.org> ---
Created attachment 90610
  --> https://bugs.freedesktop.org/attachment.cgi?id=90610&action=edit
Xorg log (fresh start, not the oops)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386772885.ddFDeCc1.5074
Date: Wed, 11 Dec 2013 14:41:25 +0000
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
   title="NEW --- - [NVC0] null pointer dereference (nouveau_fence_wait_uevent.isra.5)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72599#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC0] null pointer dereference (nouveau_fence_wait_uevent.isra.5)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72599">bug 72599</a>
              from <span class="vcard"><a class="email" href="mailto:ua_bugzilla_freedesktop&#64;binary-island.eu" title="Matthias Dahl &lt;ua_bugzilla_freedesktop&#64;binary-island.eu&gt;"> <span class="fn">Matthias Dahl</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=90610" name="attach_90610" title="Xorg log (fresh start, not the oops)">attachment 90610</a> <a href="attachment.cgi?id=90610&amp;action=edit" title="Xorg log (fresh start, not the oops)">[details]</a></span>
Xorg log (fresh start, not the oops)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386772885.ddFDeCc1.5074--

--===============1611396304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1611396304==--
