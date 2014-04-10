From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75761] weston-launch no output - black screen
Date: Thu, 10 Apr 2014 23:39:03 +0000
Message-ID: <bug-75761-8800-9JYeQup2Mk@http.bugs.freedesktop.org/>
References: <bug-75761-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1443722002=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75761-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1443722002==
Content-Type: multipart/alternative; boundary="1397173143.D54bBb0A4.27045"; charset="us-ascii"


--1397173143.D54bBb0A4.27045
Date: Thu, 10 Apr 2014 23:39:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75761

--- Comment #18 from Lubosz Sarnecki <lubosz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I was able to boot all commits with following boot option:
nouveau.config=NvMSI=0

Thanks to xexaxo on the IRC for pointing out this option.


f074d733866628973eca0ddb0c534ef4561da9e0 is the first bad commit
commit f074d733866628973eca0ddb0c534ef4561da9e0
Author: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Date:   Wed Nov 20 15:14:31 2013 +1000

    drm/nouveau/kms: send timestamp data for correct head in flip completion
events

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

:040000 040000 99b978c435e8bb3e7bd91e30daf953940dcfe99c
dcff6c807e51e53d4de0064678c46bfd68e0a1ca M    drivers


Canonical broke Weston for me ;)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397173143.D54bBb0A4.27045
Date: Thu, 10 Apr 2014 23:39:03 +0000
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
   title="NEW --- - weston-launch no output - black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75761#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - weston-launch no output - black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75761">bug 75761</a>
              from <span class="vcard"><a class="email" href="mailto:lubosz&#64;gmail.com" title="Lubosz Sarnecki &lt;lubosz&#64;gmail.com&gt;"> <span class="fn">Lubosz Sarnecki</span></a>
</span></b>
        <pre>I was able to boot all commits with following boot option:
nouveau.config=NvMSI=0

Thanks to xexaxo on the IRC for pointing out this option.


f074d733866628973eca0ddb0c534ef4561da9e0 is the first bad commit
commit f074d733866628973eca0ddb0c534ef4561da9e0
Author: Maarten Lankhorst &lt;<a href="mailto:maarten.lankhorst&#64;canonical.com">maarten.lankhorst&#64;canonical.com</a>&gt;
Date:   Wed Nov 20 15:14:31 2013 +1000

    drm/nouveau/kms: send timestamp data for correct head in flip completion
events

    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;

:040000 040000 99b978c435e8bb3e7bd91e30daf953940dcfe99c
dcff6c807e51e53d4de0064678c46bfd68e0a1ca M    drivers


Canonical broke Weston for me ;)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397173143.D54bBb0A4.27045--

--===============1443722002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1443722002==--
