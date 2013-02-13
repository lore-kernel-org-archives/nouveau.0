From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Wed, 13 Feb 2013 12:09:10 +0000
Message-ID: <bug-59168-8800-amOqq5S01p@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1801770494=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1801770494==
Content-Type: multipart/alternative; boundary="1360757350.13B7E3.22319"; charset="us-ascii"


--1360757350.13B7E3.22319
Date: Wed, 13 Feb 2013 12:09:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

--- Comment #8 from Andrew Meredith <andrew-WRb9RK/hc+jYtjvyW6yDsg@public.gmane.org> ---
I have switched to using the proprietary nvidia drivers as this issue was too
debilitating for daily use. I can confirm:

1 - Both suspend and resume are now flawless.

2 - The issue I had been having with gnome-shell repeatedly crashing has now
apparently stopped.

Sorry to be the bearer of bad news.

Dell Latitude 6530
kernel-3.7.6-201.fc18.x86_64
xorg-x11-drv-nouveau-1.0.6-1.fc18.x86_64
mesa-dri-drivers-9.0.1-4.fc18.i686

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1360757350.13B7E3.22319
Date: Wed, 13 Feb 2013 12:09:10 +0000
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
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:andrew&#64;anvil.org" title="Andrew Meredith &lt;andrew&#64;anvil.org&gt;"> <span class="fn">Andrew Meredith</span></a>
</span></b>
        <pre>I have switched to using the proprietary nvidia drivers as this issue was too
debilitating for daily use. I can confirm:

1 - Both suspend and resume are now flawless.

2 - The issue I had been having with gnome-shell repeatedly crashing has now
apparently stopped.

Sorry to be the bearer of bad news.

Dell Latitude 6530
kernel-3.7.6-201.fc18.x86_64
xorg-x11-drv-nouveau-1.0.6-1.fc18.x86_64
mesa-dri-drivers-9.0.1-4.fc18.i686</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1360757350.13B7E3.22319--

--===============1801770494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1801770494==--
