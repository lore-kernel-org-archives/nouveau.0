From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75464] New: [nv4e] [vdpau] causes hangs
Date: Mon, 24 Feb 2014 19:54:35 +0000
Message-ID: <bug-75464-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1688187851=="
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


--===============1688187851==
Content-Type: multipart/alternative; boundary="1393271675.E373a45B1.24168"; charset="us-ascii"


--1393271675.E373a45B1.24168
Date: Mon, 24 Feb 2014 19:54:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75464

          Priority: medium
            Bug ID: 75464
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [nv4e] [vdpau] causes hangs
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

I saw this on IRC:

10:59 #nouveau: < mupuf> ok
11:00 #nouveau: < blackiner> imirkin: i know you were messing around a bit on
nv4x video decoding stuff a bit back, did you have any patches that would have
affected a nv43 recently?
11:00 #nouveau: < blackiner> just tried out arch on my other machine, any vdpau
video seems to freeze the machine on it
11:01 #nouveau: < blackiner> but xv works fine
11:01 #nouveau: < imirkin> blackiner: there is no vdpau support for nv4x. there
is xvmc support however.
11:01 #nouveau: < imirkin> blackiner: i do think that some distros recently
started including libvdpau_nouveau.so though
11:01 #nouveau: < imirkin> which is probably why you've just started seeing
issues
11:01 #nouveau: < blackiner> yeah it seems to install all the vdpau stuff by
default
11:02 #nouveau: < imirkin> it's probably the case that vdpau is somehow broken
for nv4x
11:02 #nouveau: < imirkin> there's definitely no video decoding support in
there
11:02 #nouveau: < blackiner> I wonder if there is some init function somewhere
where it should just tell vdpau: No, not possible, please go away
11:02 #nouveau: < imirkin> but the presentation layer probably tries to do some
timing thing
11:02 #nouveau: < imirkin> and i've seen the timer stuff be broken on nv4x
11:02 #nouveau: < imirkin> well, i added that for nv3x
11:03 #nouveau: < imirkin> (well, i added a requirement for NPOT textures) 

And I saw this in my dmesg with flash:

[14826.835439] nouveau E[  PGRAPH][0000:00:05.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[14826.835480] nouveau E[  PGRAPH][0000:00:05.0] ch 3 [0x00056000
plugin-containe[15953]] subc 7 class 0x4497 mthd 0x020
8 data 0x00000120
[14826.835832] nouveau E[  PGRAPH][0000:00:05.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[14826.836292] nouveau E[  PGRAPH][0000:00:05.0] ch 3 [0x00056000
plugin-containe[15953]] subc 7 class 0x4497 mthd 0x020
8 data 0x00000120
[14826.836355] nouveau E[  PGRAPH][0000:00:05.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[14826.836973] nouveau E[  PGRAPH][0000:00:05.0] ch 3 [0x00056000
plugin-containe[15953]] subc 7 class 0x4497 mthd 0x0208 data 0x00000120
[14826.837046] nouveau E[  PGRAPH][0000:00:05.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[14826.837607] nouveau E[  PGRAPH][0000:00:05.0] ch 3 [0x00056000
plugin-containe[15953]] subc 7 class 0x4497 mthd 0x0208 data 0x00000120
[14826.837724] nouveau E[  PGRAPH][0000:00:05.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[14826.838284] nouveau E[  PGRAPH][0000:00:05.0] ch 3 [0x00056000
plugin-containe[15953]] subc 7 class 0x4497 mthd 0x0208 data 0x00000120

I think this issue crashed my machine as I was opening something in Youtube.
The relevant output was this:

feb 24 13:39:00 Charlie kernel: nouveau E[plugin-containe[28001]] failed to
idle channel 0xcccc0000 [plugin-containe[2
feb 24 13:39:15 Charlie kernel: [sched_delayed] sched: RT throttling activated
feb 24 13:39:15 Charlie kernel: nouveau E[plugin-containe[28001]] failed to
idle channel 0xcccc0000 [plugin-containe[2
feb 24 13:42:18 Charlie kernel: nouveau E[  X[832]] failed to idle channel
0xcccc0000 [X[832]]
feb 24 13:42:18 Charlie kernel: nouveau E[  X[832]] failed to idle channel
0xcccc0000 [X[832]]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393271675.E373a45B1.24168
Date: Mon, 24 Feb 2014 19:54:35 +0000
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
   title="NEW --- - [nv4e] [vdpau] causes hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75464">75464</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nv4e] [vdpau] causes hangs
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
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>ronald645&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
        <pre>I saw this on IRC:

10:59 #nouveau: &lt; mupuf&gt; ok
11:00 #nouveau: &lt; blackiner&gt; imirkin: i know you were messing around a bit on
nv4x video decoding stuff a bit back, did you have any patches that would have
affected a nv43 recently?
11:00 #nouveau: &lt; blackiner&gt; just tried out arch on my other machine, any vdpau
video seems to freeze the machine on it
11:01 #nouveau: &lt; blackiner&gt; but xv works fine
11:01 #nouveau: &lt; imirkin&gt; blackiner: there is no vdpau support for nv4x. there
is xvmc support however.
11:01 #nouveau: &lt; imirkin&gt; blackiner: i do think that some distros recently
started including libvdpau_nouveau.so though
11:01 #nouveau: &lt; imirkin&gt; which is probably why you've just started seeing
issues
11:01 #nouveau: &lt; blackiner&gt; yeah it seems to install all the vdpau stuff by
default
11:02 #nouveau: &lt; imirkin&gt; it's probably the case that vdpau is somehow broken
for nv4x
11:02 #nouveau: &lt; imirkin&gt; there's definitely no video decoding support in
there
11:02 #nouveau: &lt; blackiner&gt; I wonder if there is some init function somewhere
where it should just tell vdpau: No, not possible, please go away
11:02 #nouveau: &lt; imirkin&gt; but the presentation layer probably tries to do some
timing thing
11:02 #nouveau: &lt; imirkin&gt; and i've seen the timer stuff be broken on nv4x
11:02 #nouveau: &lt; imirkin&gt; well, i added that for nv3x
11:03 #nouveau: &lt; imirkin&gt; (well, i added a requirement for NPOT textures) 

And I saw this in my dmesg with flash:

[14826.835439] nouveau E[  PGRAPH][0000:00:05.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[14826.835480] nouveau E[  PGRAPH][0000:00:05.0] ch 3 [0x00056000
plugin-containe[15953]] subc 7 class 0x4497 mthd 0x020
8 data 0x00000120
[14826.835832] nouveau E[  PGRAPH][0000:00:05.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[14826.836292] nouveau E[  PGRAPH][0000:00:05.0] ch 3 [0x00056000
plugin-containe[15953]] subc 7 class 0x4497 mthd 0x020
8 data 0x00000120
[14826.836355] nouveau E[  PGRAPH][0000:00:05.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[14826.836973] nouveau E[  PGRAPH][0000:00:05.0] ch 3 [0x00056000
plugin-containe[15953]] subc 7 class 0x4497 mthd 0x0208 data 0x00000120
[14826.837046] nouveau E[  PGRAPH][0000:00:05.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[14826.837607] nouveau E[  PGRAPH][0000:00:05.0] ch 3 [0x00056000
plugin-containe[15953]] subc 7 class 0x4497 mthd 0x0208 data 0x00000120
[14826.837724] nouveau E[  PGRAPH][0000:00:05.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[14826.838284] nouveau E[  PGRAPH][0000:00:05.0] ch 3 [0x00056000
plugin-containe[15953]] subc 7 class 0x4497 mthd 0x0208 data 0x00000120

I think this issue crashed my machine as I was opening something in Youtube.
The relevant output was this:

feb 24 13:39:00 Charlie kernel: nouveau E[plugin-containe[28001]] failed to
idle channel 0xcccc0000 [plugin-containe[2
feb 24 13:39:15 Charlie kernel: [sched_delayed] sched: RT throttling activated
feb 24 13:39:15 Charlie kernel: nouveau E[plugin-containe[28001]] failed to
idle channel 0xcccc0000 [plugin-containe[2
feb 24 13:42:18 Charlie kernel: nouveau E[  X[832]] failed to idle channel
0xcccc0000 [X[832]]
feb 24 13:42:18 Charlie kernel: nouveau E[  X[832]] failed to idle channel
0xcccc0000 [X[832]]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393271675.E373a45B1.24168--

--===============1688187851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1688187851==--
