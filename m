From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82255] [VP2] Chroma planes are vertically stretched
 during VDPAU playback
Date: Mon, 01 Sep 2014 13:08:30 +0000
Message-ID: <bug-82255-8800-N6kIjbjdoL@http.bugs.freedesktop.org/>
References: <bug-82255-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1054703008=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82255-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1054703008==
Content-Type: multipart/alternative; boundary="1409576910.Ee280.28169"; charset="us-ascii"


--1409576910.Ee280.28169
Date: Mon, 1 Sep 2014 13:08:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82255

--- Comment #14 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 105560
  --> https://bugs.freedesktop.org/attachment.cgi?id=105560&action=edit
Ilia's earlier patch

The patch that you've linked earlier on IRC works like a champ for both vlc and
flashplayer. Thanks !!!

Both of program still cause some dmesg spam, perhaps caused due to the multiple
(guessing two but could be more) vdpau instances, leading to concurrency issues
? I feel that one is unrelated to the original report though :\

VLC

DATA_ERROR INVALID_BITFIELD
ch 4 [0x003f92e000 vlc[17648]] subc 3 class 0x8297 mthd 0x0200 data 0x00007fc1
trapped write at 0x00901c78c0 on channel 0x0003f92e [vlc[17648]]
PGRAPH/PROP/RT0 reason: PT_NOT_PRESENT
DATA_ERROR INVALID_BITFIELD
TRAP_PROP - TP 0 - RT_FAULT - Address 00901c78c0
TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000000, e20: 00001100,
e24: 00030000
TRAP_PROP - TP 1 - RT_FAULT - Address 00901c7900
TRAP_PROP - TP 1 - e0c: 00000000, e18: 00000000, e1c: 00000010, e20: 00001100,
e24: 00030000
ch 4 [0x003f92e000 vlc[17648]] subc 3 class 0x8297 mthd 0x0200 data 0x00007fc1
trapped write at 0x00901c8500 on channel 0x0003f92e [vlc[17648]]
PGRAPH/PROP/RT0 reason: PT_NOT_PRESENT
DATA_ERROR INVALID_BITFIELD
TRAP_PROP - TP 0 - RT_FAULT - Address 00901c8c80
TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00130030, e20: 00001100,
e24: 00030000
TRAP_PROP - TP 1 - RT_FAULT - Address 00901c9a80
...


flashplayer

DATA_ERROR INVALID_VALUE
ch 4 [0x003f92e000 plugin-containe[17913]] subc 3 class 0x8297 mthd 0x0204 data
0x000e6008
DATA_ERROR INVALID_VALUE
TRAP_PROP - TP 0 - RT_LINEAR_MISMATCH - Address 0000000000
TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000000, e20: 00001100,
e24: 0002007a
TRAP_PROP - TP 1 - RT_LINEAR_MISMATCH - Address 0000000000
TRAP_PROP - TP 1 - e0c: 00000000, e18: 00000000, e1c: 00000010, e20: 00001100,
e24: 0002007a
ch 4 [0x003f92e000 plugin-containe[17913]] subc 3 class 0x8297 mthd 0x0204 data
0x006b7008
DATA_ERROR INVALID_VALUE
ch 4 [0x003f92e000 plugin-containe[17913]] subc 3 class 0x8297 mthd 0x0204 data
0x00d6f008
TRAP_PROP - TP 0 - RT_FAULT - Address 00000e6000
TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000000, e20: 00001100,
e24: 00030000
TRAP_PROP - TP 1 - RT_FAULT - Address 00000e6040
TRAP_PROP - TP 1 - e0c: 00000000, e18: 00000000, e1c: 00000010, e20: 00001100,
e24: 00030000
...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409576910.Ee280.28169
Date: Mon, 1 Sep 2014 13:08:30 +0000
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
   title="NEW --- - [VP2] Chroma planes are vertically stretched during VDPAU playback"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82255#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [VP2] Chroma planes are vertically stretched during VDPAU playback"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82255">bug 82255</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=105560" name="attach_105560" title="Ilia's earlier patch">attachment 105560</a> <a href="attachment.cgi?id=105560&amp;action=edit" title="Ilia's earlier patch">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=82255&amp;attachment=105560'>[review]</a>
Ilia's earlier patch

The patch that you've linked earlier on IRC works like a champ for both vlc and
flashplayer. Thanks !!!

Both of program still cause some dmesg spam, perhaps caused due to the multiple
(guessing two but could be more) vdpau instances, leading to concurrency issues
? I feel that one is unrelated to the original report though :\

VLC

DATA_ERROR INVALID_BITFIELD
ch 4 [0x003f92e000 vlc[17648]] subc 3 class 0x8297 mthd 0x0200 data 0x00007fc1
trapped write at 0x00901c78c0 on channel 0x0003f92e [vlc[17648]]
PGRAPH/PROP/RT0 reason: PT_NOT_PRESENT
DATA_ERROR INVALID_BITFIELD
TRAP_PROP - TP 0 - RT_FAULT - Address 00901c78c0
TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000000, e20: 00001100,
e24: 00030000
TRAP_PROP - TP 1 - RT_FAULT - Address 00901c7900
TRAP_PROP - TP 1 - e0c: 00000000, e18: 00000000, e1c: 00000010, e20: 00001100,
e24: 00030000
ch 4 [0x003f92e000 vlc[17648]] subc 3 class 0x8297 mthd 0x0200 data 0x00007fc1
trapped write at 0x00901c8500 on channel 0x0003f92e [vlc[17648]]
PGRAPH/PROP/RT0 reason: PT_NOT_PRESENT
DATA_ERROR INVALID_BITFIELD
TRAP_PROP - TP 0 - RT_FAULT - Address 00901c8c80
TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00130030, e20: 00001100,
e24: 00030000
TRAP_PROP - TP 1 - RT_FAULT - Address 00901c9a80
...


flashplayer

DATA_ERROR INVALID_VALUE
ch 4 [0x003f92e000 plugin-containe[17913]] subc 3 class 0x8297 mthd 0x0204 data
0x000e6008
DATA_ERROR INVALID_VALUE
TRAP_PROP - TP 0 - RT_LINEAR_MISMATCH - Address 0000000000
TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000000, e20: 00001100,
e24: 0002007a
TRAP_PROP - TP 1 - RT_LINEAR_MISMATCH - Address 0000000000
TRAP_PROP - TP 1 - e0c: 00000000, e18: 00000000, e1c: 00000010, e20: 00001100,
e24: 0002007a
ch 4 [0x003f92e000 plugin-containe[17913]] subc 3 class 0x8297 mthd 0x0204 data
0x006b7008
DATA_ERROR INVALID_VALUE
ch 4 [0x003f92e000 plugin-containe[17913]] subc 3 class 0x8297 mthd 0x0204 data
0x00d6f008
TRAP_PROP - TP 0 - RT_FAULT - Address 00000e6000
TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000000, e20: 00001100,
e24: 00030000
TRAP_PROP - TP 1 - RT_FAULT - Address 00000e6040
TRAP_PROP - TP 1 - e0c: 00000000, e18: 00000000, e1c: 00000010, e20: 00001100,
e24: 00030000
...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409576910.Ee280.28169--

--===============1054703008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1054703008==--
