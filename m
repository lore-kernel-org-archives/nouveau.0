From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58305] Kernel crashes if nVidia card is powered off
 and X restartted
Date: Mon, 18 Nov 2013 21:33:34 +0000
Message-ID: <bug-58305-8800-vuXwlVHcqe@http.bugs.freedesktop.org/>
References: <bug-58305-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1647550901=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58305-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1647550901==
Content-Type: multipart/alternative; boundary="1384810414.b5E2CDAf1.4150"; charset="us-ascii"


--1384810414.b5E2CDAf1.4150
Date: Mon, 18 Nov 2013 21:33:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58305

--- Comment #10 from Dimitar Kosev <buboleck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Ok, I had some time to try 3.12... it's even worse, kernel crashesh short time
after loading nouveau module. Starting X completely locks the system.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384810414.b5E2CDAf1.4150
Date: Mon, 18 Nov 2013 21:33:34 +0000
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
   title="NEW --- - Kernel crashes if nVidia card is powered off and X restartted"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58305#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Kernel crashes if nVidia card is powered off and X restartted"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58305">bug 58305</a>
              from <span class="vcard"><a class="email" href="mailto:buboleck&#64;gmail.com" title="Dimitar Kosev &lt;buboleck&#64;gmail.com&gt;"> <span class="fn">Dimitar Kosev</span></a>
</span></b>
        <pre>Ok, I had some time to try 3.12... it's even worse, kernel crashesh short time
after loading nouveau module. Starting X completely locks the system.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384810414.b5E2CDAf1.4150--

--===============1647550901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1647550901==--
