From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56615] [NVD9] Unable to start X on ThinkPad T420s
	laptop
Date: Wed, 24 Jul 2013 14:00:36 +0000
Message-ID: <bug-56615-8800-59iFtoIEiN@http.bugs.freedesktop.org/>
References: <bug-56615-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0939898725=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56615-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0939898725==
Content-Type: multipart/alternative; boundary="1374674436.bd2B1E81.7921"; charset="us-ascii"


--1374674436.bd2B1E81.7921
Date: Wed, 24 Jul 2013 14:00:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56615

--- Comment #11 from Mark Cave-Ayland <mark.cave-ayland-r2/yp8inhXLQXOPxS62xeg@public.gmane.org> ---
I've seen some interesting patches go through the mailing list which I thought
may be related to this bug, so I thought I'd update to 3.6.11-rc2 and see if
there was any improvement.

Unfortunately I am still unable to use the DisplayPort connector in order to
drive an external monitor :(

Just to summarise for those who are interested:

1) My laptop is set so that it is forced to use nVidia graphics adapter, i.e.
the Optimus mode is disabled in the BIOS.

2) If I run Nouveau without anything plugged into the DisplayPort connector on
my laptop, it runs fine.

3) If I connect an external monitor to the DisplayPort connector and reboot
then X freezes upon startup, even before enabling the external display. Under
3.6.11-rc2 I see the following in dmesg:

nouveau E[   PDISP][0000:01:00.0] chid 1 mthd 0x0080 data 0x00000000 0x00005080
0x0000000

4) If I now unplug the DisplayPort connector, I see the following in dmesg:

nouveau E[     DRM] DDC responded, but no EDID for DP-1

5) If I now try and start X again, it still freezes but for less time than
before.

6) Restarting the laptop without the DisplayPort connector plugged in is
required in order for Nouveau to work on the in-built display once again.


Any further debugging information available on request. I have an up-to-date
git tree to which I can temporarily apply diagnostic patches if required.


Many thanks,

Mark.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374674436.bd2B1E81.7921
Date: Wed, 24 Jul 2013 14:00:36 +0000
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
   title="NEW --- - [NVD9] Unable to start X on ThinkPad T420s laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56615#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] Unable to start X on ThinkPad T420s laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56615">bug 56615</a>
              from <span class="vcard"><a class="email" href="mailto:mark.cave-ayland&#64;ilande.co.uk" title="Mark Cave-Ayland &lt;mark.cave-ayland&#64;ilande.co.uk&gt;"> <span class="fn">Mark Cave-Ayland</span></a>
</span></b>
        <pre>I've seen some interesting patches go through the mailing list which I thought
may be related to this bug, so I thought I'd update to 3.6.11-rc2 and see if
there was any improvement.

Unfortunately I am still unable to use the DisplayPort connector in order to
drive an external monitor :(

Just to summarise for those who are interested:

1) My laptop is set so that it is forced to use nVidia graphics adapter, i.e.
the Optimus mode is disabled in the BIOS.

2) If I run Nouveau without anything plugged into the DisplayPort connector on
my laptop, it runs fine.

3) If I connect an external monitor to the DisplayPort connector and reboot
then X freezes upon startup, even before enabling the external display. Under
3.6.11-rc2 I see the following in dmesg:

nouveau E[   PDISP][0000:01:00.0] chid 1 mthd 0x0080 data 0x00000000 0x00005080
0x0000000

4) If I now unplug the DisplayPort connector, I see the following in dmesg:

nouveau E[     DRM] DDC responded, but no EDID for DP-1

5) If I now try and start X again, it still freezes but for less time than
before.

6) Restarting the laptop without the DisplayPort connector plugged in is
required in order for Nouveau to work on the in-built display once again.


Any further debugging information available on request. I have an up-to-date
git tree to which I can temporarily apply diagnostic patches if required.


Many thanks,

Mark.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374674436.bd2B1E81.7921--

--===============0939898725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0939898725==--
