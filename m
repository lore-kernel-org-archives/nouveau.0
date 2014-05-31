From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75761] weston-launch no output - black screen
Date: Sat, 31 May 2014 03:41:53 +0000
Message-ID: <bug-75761-8800-yKtXwfrJSW@http.bugs.freedesktop.org/>
References: <bug-75761-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0131976088=="
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


--===============0131976088==
Content-Type: multipart/alternative; boundary="1401507713.Fa2b4.22388"; charset="us-ascii"


--1401507713.Fa2b4.22388
Date: Sat, 31 May 2014 03:41:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75761

--- Comment #27 from nerdopolis1-H+0wwilmMs3R7s880joybQ@public.gmane.org ---
I pulled out my old Dell desktop with a Pentium 4 processor, and AGB Nvidia
card (NV36), and it does the same thing. Mark45 on Phoronix said this issue
affected all 3 of his Nvidia cards when he tried to use my Wayland Live CD.

I added the "got pageflip event" lines as suggested, and it seems that they
appear multiple times in the log, and seem to keep going until I tty switch,
but the screen is still black. Using a vanilla Ubuntu kernel, and passing
nouveau.config=NvMSI=0 did not work for me, or for Mark45 on any of his Nvidia
cards.

Weston-desktop-shell starts fine, and I also tried weston-simple-shm, which did
not appear, but it did run.  

It can't be a mesa issue, as Weston is using pixman here in this case...

I wish I had tested this sooner, but I wasn't sure if my results on the older
desktop would reflect on newer Nvidia hardware.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401507713.Fa2b4.22388
Date: Sat, 31 May 2014 03:41:53 +0000
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
   title="REOPENED --- - weston-launch no output - black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75761#c27">Comment # 27</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - weston-launch no output - black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75761">bug 75761</a>
              from <span class="vcard"><a class="email" href="mailto:nerdopolis1&#64;verizon.net" title="nerdopolis1&#64;verizon.net">nerdopolis1&#64;verizon.net</a>
</span></b>
        <pre>I pulled out my old Dell desktop with a Pentium 4 processor, and AGB Nvidia
card (NV36), and it does the same thing. Mark45 on Phoronix said this issue
affected all 3 of his Nvidia cards when he tried to use my Wayland Live CD.

I added the &quot;got pageflip event&quot; lines as suggested, and it seems that they
appear multiple times in the log, and seem to keep going until I tty switch,
but the screen is still black. Using a vanilla Ubuntu kernel, and passing
nouveau.config=NvMSI=0 did not work for me, or for Mark45 on any of his Nvidia
cards.

Weston-desktop-shell starts fine, and I also tried weston-simple-shm, which did
not appear, but it did run.  

It can't be a mesa issue, as Weston is using pixman here in this case...

I wish I had tested this sooner, but I wasn't sure if my results on the older
desktop would reflect on newer Nvidia hardware.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401507713.Fa2b4.22388--

--===============0131976088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0131976088==--
