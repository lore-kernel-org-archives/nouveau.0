From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69488] GF108 (NVC1) GPU lockup
Date: Wed, 15 Jan 2014 18:32:16 +0000
Message-ID: <bug-69488-8800-RFSaaDHyfv@http.bugs.freedesktop.org/>
References: <bug-69488-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2082060177=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69488-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2082060177==
Content-Type: multipart/alternative; boundary="1389810735.81e0D2.31400"; charset="us-ascii"


--1389810735.81e0D2.31400
Date: Wed, 15 Jan 2014 18:32:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69488

--- Comment #30 from nforrester-/d+BM93fTQY@public.gmane.org <nforrester-/d+BM93fTQY@public.gmane.org> ---
(In reply to comment #29)
> I have this bug on a Lenovo T530, running Fedora 19 fully up-to-date as of
> today:
> kernel:   kernel-3.12.7-200.fc19.x86_64
> nouveau:xorg-x11-drv-nouveau-1.0.9-1.fc19.x86_64

Everything works up through kernel 3.11.10.  When F19 updated to 3.12.6 then,
when I log in, the window system starts, my desktop (Cinnamon or Gnome) starts,
and 23sec after I started the session by entering my user password, the screen
freezes and I cannot change another console; must turn off power to restart.

If during the live time, I open a terminal and 

tail -f /var/log/messages

the last message before the freeze is (likely unrelated and coincidental):

Jan 15 11:53:09 systemname systemd-logind[629]: Removed session c6.

and three seconds later, the screen freezes.

After reboot with 3.11.10, examining the /var/log/messages file shows that
the following messages surround the one above:

Jan 15 11:52:57 microwatt kernel: [  137.601242] ACPI Warning:
\_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type mismatch - Found [Buffer], ACPI
requires [Package] (20130725/nsarguments-95)
Jan 15 11:52:57 microwatt kernel: [  137.602299] ACPI Warning:
\_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type mismatch - Found [Buffer], ACPI
requires [Package] (20130725/nsarguments-95)
Jan 15 11:52:58 microwatt kernel: [  138.395359] thinkpad_acpi: EC reports that
Thermal Table has changed
Jan 15 11:53:09 microwatt systemd-logind[629]: Removed session c6.
Jan 15 11:53:11 microwatt kernel: [  151.742703] thinkpad_acpi: EC reports that
Thermal Table has changed
Jan 15 11:53:11 microwatt kernel: [  151.742708] nouveau 0000:01:00.0: Refused
to change power state, currently in D3
Jan 15 11:53:11 microwatt kernel: [  151.813438] nouveau 0000:01:00.0: Refused
to change power state, currently in D3
Jan 15 11:53:11 microwatt kernel: [  151.824445] nouveau 0000:01:00.0: Refused
to change power state, currently in D3
Jan 15 11:53:21 microwatt systemd-logind[629]: Power key pressed.
Jan 15 11:53:21 microwatt systemd-logind[629]: Powering Off...
Jan 15 11:53:21 microwatt systemd-logind[629]: System is powering down.
Jan 15 11:53:21 microwatt systemd[1]: Starting Show Plymouth Power Off
Screen...

at 11:53:21 I turned off power.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389810735.81e0D2.31400
Date: Wed, 15 Jan 2014 18:32:15 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - GF108 (NVC1) GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69488#c30">Comment # 30</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - GF108 (NVC1) GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69488">bug 69488</a>
              from <span class="vcard"><a class="email" href="mailto:nforrester&#64;whoi.edu" title="nforrester&#64;whoi.edu &lt;nforrester&#64;whoi.edu&gt;"> <span class="fn">nforrester&#64;whoi.edu</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=69488#c29">comment #29</a>)
<span class="quote">&gt; I have this bug on a Lenovo T530, running Fedora 19 fully up-to-date as of
&gt; today:
&gt; kernel:   kernel-3.12.7-200.fc19.x86_64
&gt; nouveau:xorg-x11-drv-nouveau-1.0.9-1.fc19.x86_64</span >

Everything works up through kernel 3.11.10.  When F19 updated to 3.12.6 then,
when I log in, the window system starts, my desktop (Cinnamon or Gnome) starts,
and 23sec after I started the session by entering my user password, the screen
freezes and I cannot change another console; must turn off power to restart.

If during the live time, I open a terminal and 

tail -f /var/log/messages

the last message before the freeze is (likely unrelated and coincidental):

Jan 15 11:53:09 systemname systemd-logind[629]: Removed session c6.

and three seconds later, the screen freezes.

After reboot with 3.11.10, examining the /var/log/messages file shows that
the following messages surround the one above:

Jan 15 11:52:57 microwatt kernel: [  137.601242] ACPI Warning:
\_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type mismatch - Found [Buffer], ACPI
requires [Package] (20130725/nsarguments-95)
Jan 15 11:52:57 microwatt kernel: [  137.602299] ACPI Warning:
\_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type mismatch - Found [Buffer], ACPI
requires [Package] (20130725/nsarguments-95)
Jan 15 11:52:58 microwatt kernel: [  138.395359] thinkpad_acpi: EC reports that
Thermal Table has changed
Jan 15 11:53:09 microwatt systemd-logind[629]: Removed session c6.
Jan 15 11:53:11 microwatt kernel: [  151.742703] thinkpad_acpi: EC reports that
Thermal Table has changed
Jan 15 11:53:11 microwatt kernel: [  151.742708] nouveau 0000:01:00.0: Refused
to change power state, currently in D3
Jan 15 11:53:11 microwatt kernel: [  151.813438] nouveau 0000:01:00.0: Refused
to change power state, currently in D3
Jan 15 11:53:11 microwatt kernel: [  151.824445] nouveau 0000:01:00.0: Refused
to change power state, currently in D3
Jan 15 11:53:21 microwatt systemd-logind[629]: Power key pressed.
Jan 15 11:53:21 microwatt systemd-logind[629]: Powering Off...
Jan 15 11:53:21 microwatt systemd-logind[629]: System is powering down.
Jan 15 11:53:21 microwatt systemd[1]: Starting Show Plymouth Power Off
Screen...

at 11:53:21 I turned off power.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389810735.81e0D2.31400--

--===============2082060177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2082060177==--
