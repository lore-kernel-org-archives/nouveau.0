From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40747] [NV44] dual-link tmds no longer allowed
Date: Wed, 05 Feb 2014 09:31:40 +0000
Message-ID: <bug-40747-8800-u73htToKXD@http.bugs.freedesktop.org/>
References: <bug-40747-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1838364019=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40747-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1838364019==
Content-Type: multipart/alternative; boundary="1391592700.c4d7cbE64.13275"; charset="us-ascii"


--1391592700.c4d7cbE64.13275
Date: Wed, 5 Feb 2014 09:31:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=40747

--- Comment #20 from Oswald Buddenhagen <ossi-RoXCvvDuEio@public.gmane.org> ---
huh?
i said that it is *easy* to convince the kernel to pick the right mode. it's
picking a wrong one only automatically. there is no hardware limitation at all
here.
X appears more tenacious, apparently because it filters out the good mode
earlier in the process. it's beyond me why it does that - it makes no sense at
all, and the log doesn't indicate anything afaics. this also puts a weird twist
on the meaning of _K_MS ...


also note that i'm a different person than the OP. i just happen to have pretty
much the same configuration (card and monitor) and consequently the same
problem.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391592700.c4d7cbE64.13275
Date: Wed, 5 Feb 2014 09:31:40 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - [NV44] dual-link tmds no longer allowed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=40747#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV44] dual-link tmds no longer allowed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=40747">bug 40747</a>
              from <span class="vcard"><a class="email" href="mailto:ossi&#64;kde.org" title="Oswald Buddenhagen &lt;ossi&#64;kde.org&gt;"> <span class="fn">Oswald Buddenhagen</span></a>
</span></b>
        <pre>huh?
i said that it is *easy* to convince the kernel to pick the right mode. it's
picking a wrong one only automatically. there is no hardware limitation at all
here.
X appears more tenacious, apparently because it filters out the good mode
earlier in the process. it's beyond me why it does that - it makes no sense at
all, and the log doesn't indicate anything afaics. this also puts a weird twist
on the meaning of _K_MS ...


also note that i'm a different person than the OP. i just happen to have pretty
much the same configuration (card and monitor) and consequently the same
problem.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391592700.c4d7cbE64.13275--

--===============1838364019==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1838364019==--
