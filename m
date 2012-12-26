From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58776] New: DRM NOUVEAU: cannot boot with kernel
	>=3.7
Date: Wed, 26 Dec 2012 10:16:32 +0000
Message-ID: <bug-58776-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2107142325=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============2107142325==
Content-Type: multipart/alternative; boundary="1356516992.6dec31.21936"; charset="us-ascii"


--1356516992.6dec31.21936
Date: Wed, 26 Dec 2012 10:16:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58776

          Priority: medium
            Bug ID: 58776
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: DRM NOUVEAU: cannot boot with kernel >=3.7
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: balducci-KqplAB4qOuE@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 72129
  --> https://bugs.freedesktop.org/attachment.cgi?id=72129&action=edit
lspci output

hello everybody,

following advice from dri-devel list I am opening a bug report here.

Starting with kernel-3.7 I am not able to boot any more in KMS: as
soon as the screen resolution changes in the very early stage of the
boot, the machine freezes and the only option I'm left with is to
press a physical reset button.

I am on an athlon64 dual core machine and using DRM/NOUVEAU with a
NVIDIA GeForce 6200 LE GPU

Here are some facts:

=> while kernel-3.7.x gives the problems mentioned above,
   kernel-3.6.{8-10} boots just fine (and X11 works nicely)
=> if it can be of any use: if I reboot from a running 3.6.x kernel
   into a 3.7.x, the obtained freezed console screen shows the (somewhat
   misplaced) lines which were printed during the shutdown phase of
   the reboot process (this is similar to what reported in Description
   of bug#46557)
=> kernel-3.7.x boots just fine on another box (another athlon64 dual core with
   a GeForce 6150SE nForce 430 (rev a2) GPU); kernel is 32bit there,
   if it can matter

I am attaching lspci output, kernel config and dmesg output w/
NOUVEAU_DEBUG_DEFAULT=6

I will be happy to send in any other information which might be useful

thank you very much  in advance

ciao
gabriele

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1356516992.6dec31.21936
Date: Wed, 26 Dec 2012 10:16:32 +0000
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
   title="NEW --- - DRM NOUVEAU: cannot boot with kernel &gt;=3.7"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58776">58776</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>DRM NOUVEAU: cannot boot with kernel &gt;=3.7
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
          <td>balducci&#64;units.it
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
        <pre>Created <span class=""><a href="attachment.cgi?id=72129" name="attach_72129" title="lspci output">attachment 72129</a> <a href="attachment.cgi?id=72129&amp;action=edit" title="lspci output">[details]</a></span>
lspci output

hello everybody,

following advice from dri-devel list I am opening a bug report here.

Starting with kernel-3.7 I am not able to boot any more in KMS: as
soon as the screen resolution changes in the very early stage of the
boot, the machine freezes and the only option I'm left with is to
press a physical reset button.

I am on an athlon64 dual core machine and using DRM/NOUVEAU with a
NVIDIA GeForce 6200 LE GPU

Here are some facts:

=&gt; while kernel-3.7.x gives the problems mentioned above,
   kernel-3.6.{8-10} boots just fine (and X11 works nicely)
=&gt; if it can be of any use: if I reboot from a running 3.6.x kernel
   into a 3.7.x, the obtained freezed console screen shows the (somewhat
   misplaced) lines which were printed during the shutdown phase of
   the reboot process (this is similar to what reported in Description
   of <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau: NV4E acceleration corruption when DMA above 31-bit (2 Gig barrier)"
   href="show_bug.cgi?id=46557">bug#46557</a>)
=&gt; kernel-3.7.x boots just fine on another box (another athlon64 dual core with
   a GeForce 6150SE nForce 430 (rev a2) GPU); kernel is 32bit there,
   if it can matter

I am attaching lspci output, kernel config and dmesg output w/
NOUVEAU_DEBUG_DEFAULT=6

I will be happy to send in any other information which might be useful

thank you very much  in advance

ciao
gabriele</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356516992.6dec31.21936--

--===============2107142325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2107142325==--
