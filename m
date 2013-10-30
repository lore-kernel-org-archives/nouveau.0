From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71035] New: EVO engine failure,
 probably (not?) related to EDID corruption
Date: Wed, 30 Oct 2013 08:01:00 +0000
Message-ID: <bug-71035-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0119401996=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0119401996==
Content-Type: multipart/alternative; boundary="1383120061.14FC1.16436"; charset="us-ascii"


--1383120061.14FC1.16436
Date: Wed, 30 Oct 2013 08:01:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71035

          Priority: medium
            Bug ID: 71035
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: EVO engine failure, probably (not?) related to EDID
                    corruption
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: nik-c8FWWMckPjiPRyzcNaLxHw@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 88342
  --> https://bugs.freedesktop.org/attachment.cgi?id=88342&action=edit
dmesg output

** Slightly modified version from Debian Bug #728278 **

The nouveau driver fails on this hardware. A talk in #nouveau on
Freenode turned up that the failure is related to the EVO engine
responsible for modesetting. Here are the relevant parts of that chat,
more explanations follow below:

08:02 < imirkin> nouveau E[   PDISP][0000:01:00.0] chid 0 mthd 0x0080 data
0x00000000 0x000d5080
08:02 < Natureshadow> that means?
08:02 < imirkin> that's a bit unfortunate
08:02 < imirkin> dunno, gimme a min
08:02 < Natureshadow> sorry, I am not a kernel hacker ;) ...
08:03 < imirkin> oh, that's the EVO flush
08:03 < imirkin> and the d5080 is probably the fifo position or something
08:03 < imirkin> uhm, silly question... do you have any indication that this
hardware actually works?
08:05 < imirkin> (e.g. on windows, or using the nvidia blob or using the nv
driver)
08:08 < Natureshadow> imirkin: it works with the nvidia driver
08:08 < imirkin> hm, ok
08:09 < Natureshadow> And GRUB can set the 1440x900 mode
08:09 < Natureshadow> So I assume VESA works as well
08:09 < imirkin> right, but that's a different mechanism
08:09 < Natureshadow> ok
08:09 < imirkin> what makes you say that edid is broken? is it broken with
nvidia driver as well?
08:09 < Natureshadow> In any case, installing the nvidia-glx driver and loading
the EDID file with X.org rather than at boot (nvidia does
                      not support modesetting) works
08:10 < Natureshadow> imirkin: Yes, it is.
08:10 < imirkin> k
08:10 < Natureshadow> The display EDID is corrupted, I have been loading that
EDID file forever with the nvidia driver
08:10 < Natureshadow> But as nouveau works great on all other hardware I have,
I wanted to get rid of that unnecessary binary blob ;)
08:11 < imirkin> yeah, for some reason the EVO commands just aren't working
08:11 < Natureshadow> Is that something I can fix ;)?
08:11 < imirkin> (these are commands used to control the display engine, which
controls the mode/etc)
08:11 < imirkin> well, if the nvidia driver works, it must be fixable
08:11 < Natureshadow> ok :D
08:11 < imirkin> the question is... how
08:12 < Natureshadow> I'm sure that question is a lot easier for you than for
me ;)
08:12 < Natureshadow> I'm ready for any debugging, may it be as crazy as you
like .)
08:14 < imirkin> well, the command likely comes from evo_sync() in
nv50_display.c
08:14 < imirkin> or perhaps nv50_display_flip_stop
08:15 < imirkin> but why does it error out? who knows. i don't know much about
the evo bits.
08:16 < Natureshadow> imirkin: hmm. so, seeing that the nvidia driver works, is
this a bug in nouveau I should report, or is it due to my
                      broken hardware?
08:16 < imirkin> given that the nvidia driver can work, it seems likely that
it's a bug in nouveau
[...]
08:33 < imirkin> it kinda feels like the evo engine isn't being turned on at
all
08:34 < imirkin> probably some missed register write somewhere
08:34 < imirkin> (whereby it normally starts out as 'on' for everone except
you)

I must add two things:

 1. The display EDID of this device is corrupted, but I have worked
    around that by ...
 2. ... loading a corrected version of the EDID binary from a file. That worked 
    (see dmesg), so I think it is irrelevant for the bug.

The effect of this issue is that when modesetting, some garbage is
written to the screen, the scrollback buffer is scrolled up a bit, but
modesetting never really happens.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383120061.14FC1.16436
Date: Wed, 30 Oct 2013 08:01:01 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - EVO engine failure, probably (not?) related to EDID corruption"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71035">71035</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>EVO engine failure, probably (not?) related to EDID corruption
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>nik&#64;naturalnet.de
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=88342" name="attach_88342" title="dmesg output">attachment 88342</a> <a href="attachment.cgi?id=88342&amp;action=edit" title="dmesg output">[details]</a></span>
dmesg output

** Slightly modified version from Debian Bug #728278 **

The nouveau driver fails on this hardware. A talk in #nouveau on
Freenode turned up that the failure is related to the EVO engine
responsible for modesetting. Here are the relevant parts of that chat,
more explanations follow below:

08:02 &lt; imirkin&gt; nouveau E[   PDISP][0000:01:00.0] chid 0 mthd 0x0080 data
0x00000000 0x000d5080
08:02 &lt; Natureshadow&gt; that means?
08:02 &lt; imirkin&gt; that's a bit unfortunate
08:02 &lt; imirkin&gt; dunno, gimme a min
08:02 &lt; Natureshadow&gt; sorry, I am not a kernel hacker ;) ...
08:03 &lt; imirkin&gt; oh, that's the EVO flush
08:03 &lt; imirkin&gt; and the d5080 is probably the fifo position or something
08:03 &lt; imirkin&gt; uhm, silly question... do you have any indication that this
hardware actually works?
08:05 &lt; imirkin&gt; (e.g. on windows, or using the nvidia blob or using the nv
driver)
08:08 &lt; Natureshadow&gt; imirkin: it works with the nvidia driver
08:08 &lt; imirkin&gt; hm, ok
08:09 &lt; Natureshadow&gt; And GRUB can set the 1440x900 mode
08:09 &lt; Natureshadow&gt; So I assume VESA works as well
08:09 &lt; imirkin&gt; right, but that's a different mechanism
08:09 &lt; Natureshadow&gt; ok
08:09 &lt; imirkin&gt; what makes you say that edid is broken? is it broken with
nvidia driver as well?
08:09 &lt; Natureshadow&gt; In any case, installing the nvidia-glx driver and loading
the EDID file with X.org rather than at boot (nvidia does
                      not support modesetting) works
08:10 &lt; Natureshadow&gt; imirkin: Yes, it is.
08:10 &lt; imirkin&gt; k
08:10 &lt; Natureshadow&gt; The display EDID is corrupted, I have been loading that
EDID file forever with the nvidia driver
08:10 &lt; Natureshadow&gt; But as nouveau works great on all other hardware I have,
I wanted to get rid of that unnecessary binary blob ;)
08:11 &lt; imirkin&gt; yeah, for some reason the EVO commands just aren't working
08:11 &lt; Natureshadow&gt; Is that something I can fix ;)?
08:11 &lt; imirkin&gt; (these are commands used to control the display engine, which
controls the mode/etc)
08:11 &lt; imirkin&gt; well, if the nvidia driver works, it must be fixable
08:11 &lt; Natureshadow&gt; ok :D
08:11 &lt; imirkin&gt; the question is... how
08:12 &lt; Natureshadow&gt; I'm sure that question is a lot easier for you than for
me ;)
08:12 &lt; Natureshadow&gt; I'm ready for any debugging, may it be as crazy as you
like .)
08:14 &lt; imirkin&gt; well, the command likely comes from evo_sync() in
nv50_display.c
08:14 &lt; imirkin&gt; or perhaps nv50_display_flip_stop
08:15 &lt; imirkin&gt; but why does it error out? who knows. i don't know much about
the evo bits.
08:16 &lt; Natureshadow&gt; imirkin: hmm. so, seeing that the nvidia driver works, is
this a bug in nouveau I should report, or is it due to my
                      broken hardware?
08:16 &lt; imirkin&gt; given that the nvidia driver can work, it seems likely that
it's a bug in nouveau
[...]
08:33 &lt; imirkin&gt; it kinda feels like the evo engine isn't being turned on at
all
08:34 &lt; imirkin&gt; probably some missed register write somewhere
08:34 &lt; imirkin&gt; (whereby it normally starts out as 'on' for everone except
you)

I must add two things:

 1. The display EDID of this device is corrupted, but I have worked
    around that by ...
 2. ... loading a corrected version of the EDID binary from a file. That worked 
    (see dmesg), so I think it is irrelevant for the bug.

The effect of this issue is that when modesetting, some garbage is
written to the screen, the scrollback buffer is scrolled up a bit, but
modesetting never really happens.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383120061.14FC1.16436--

--===============0119401996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0119401996==--
