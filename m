From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64904] [BISECTED] nouveau,
 nv50: External VGA not detected anymore
Date: Mon, 27 May 2013 22:23:58 +0000
Message-ID: <bug-64904-8800-dhpTaDPPdO@http.bugs.freedesktop.org/>
References: <bug-64904-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2119297017=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64904-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2119297017==
Content-Type: multipart/alternative; boundary="1369693438.cb5a2.1446"; charset="us-ascii"


--1369693438.cb5a2.1446
Date: Mon, 27 May 2013 22:23:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64904

--- Comment #10 from Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Strictly speaking it should probably be (load & 7) == 7, but I don't think
it'll fix it on its own, you might want to dump the value of load to be sure,
with all those patches.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1369693438.cb5a2.1446
Date: Mon, 27 May 2013 22:23:58 +0000
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
   title="NEW --- - [BISECTED] nouveau, nv50: External VGA not detected anymore"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64904#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [BISECTED] nouveau, nv50: External VGA not detected anymore"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64904">bug 64904</a>
              from <span class="vcard"><a class="email" href="mailto:m.b.lankhorst&#64;gmail.com" title="Maarten Lankhorst &lt;m.b.lankhorst&#64;gmail.com&gt;"> <span class="fn">Maarten Lankhorst</span></a>
</span></b>
        <pre>Strictly speaking it should probably be (load &amp; 7) == 7, but I don't think
it'll fix it on its own, you might want to dump the value of load to be sure,
with all those patches.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1369693438.cb5a2.1446--

--===============2119297017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2119297017==--
