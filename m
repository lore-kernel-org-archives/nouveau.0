From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59858] nvidia Quadro 1000m - White screen after
	suspend
Date: Mon, 28 Jan 2013 12:44:22 +0000
Message-ID: <bug-59858-8800-OWup6MUHeP@http.bugs.freedesktop.org/>
References: <bug-59858-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1551016358=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59858-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1551016358==
Content-Type: multipart/alternative; boundary="1359377062.af115EBa2.31131"; charset="us-ascii"


--1359377062.af115EBa2.31131
Date: Mon, 28 Jan 2013 12:44:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59858

--- Comment #2 from Andrew Meredith <andrew-WRb9RK/hc+jYtjvyW6yDsg@public.gmane.org> ---
I have the same issue with F18:

xorg-x11-server-Xorg-1.13.1-4.fc18.x86_64
xorg-x11-drv-nouveau-1.0.6-1.fc18.x86_64
kernel-3.7.2-204.fc18.x86_64
gdm-3.6.2-5.fc18.x86_64
gdm-libs-3.6.2-5.fc18.x86_64

It all works fine until I resume after a suspend, when I get a speckled white
screen with no mouse. I can switch to a tty console. If I then log in as root
on the tty console and run:

     init 3 ; sleep 5 ; init 5

It gives me back a functional login page and all works fine from then on ...
until the next suspend/resume.

Any keyboard or mouse activity produces another spurt of the following lines in
the messages log. I include one of each below, but there are dozens of each on
every movement.


[71595.275820] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fcfa000]
[71595.276698] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040a1e
......

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1359377062.af115EBa2.31131
Date: Mon, 28 Jan 2013 12:44:22 +0000
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
   title="NEW --- - nvidia Quadro 1000m - White screen after suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59858#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nvidia Quadro 1000m - White screen after suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59858">bug 59858</a>
              from <span class="vcard"><a class="email" href="mailto:andrew&#64;anvil.org" title="Andrew Meredith &lt;andrew&#64;anvil.org&gt;"> <span class="fn">Andrew Meredith</span></a>
</span></b>
        <pre>I have the same issue with F18:

xorg-x11-server-Xorg-1.13.1-4.fc18.x86_64
xorg-x11-drv-nouveau-1.0.6-1.fc18.x86_64
kernel-3.7.2-204.fc18.x86_64
gdm-3.6.2-5.fc18.x86_64
gdm-libs-3.6.2-5.fc18.x86_64

It all works fine until I resume after a suspend, when I get a speckled white
screen with no mouse. I can switch to a tty console. If I then log in as root
on the tty console and run:

     init 3 ; sleep 5 ; init 5

It gives me back a functional login page and all works fine from then on ...
until the next suspend/resume.

Any keyboard or mouse activity produces another spurt of the following lines in
the messages log. I include one of each below, but there are dozens of each on
every movement.


[71595.275820] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fcfa000]
[71595.276698] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040a1e
......</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1359377062.af115EBa2.31131--

--===============1551016358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1551016358==--
