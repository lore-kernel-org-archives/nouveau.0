From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60704] New: [nouveau,
 git regression] - I2C PWM fan control broken on nv50 adt7475 on
 kernels 3.3.x+
Date: Mon, 11 Feb 2013 23:25:30 +0000
Message-ID: <bug-60704-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0879872138=="
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


--===============0879872138==
Content-Type: multipart/alternative; boundary="1360625130.bB0C01.15419"; charset="us-ascii"


--1360625130.bB0C01.15419
Date: Mon, 11 Feb 2013 23:25:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60704

          Priority: medium
            Bug ID: 60704
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [nouveau, git regression] - I2C PWM fan control broken
                    on nv50 adt7475 on kernels 3.3.x+
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: m.meledandri-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 74657
  --> https://bugs.freedesktop.org/attachment.cgi?id=74657&action=edit
ic2-bit-banging-nouveau-git-bisect.log

When resuming from suspend on affected kernels the lack of fan pwm control
causes the GPU fan to run at 100%. This is noisy, annoying and inefficient.

After performing a git bisect (attached), I've determined the commit that broke
pwm fan control functionality for all kernels 3.3.x+ with adt7475 controller
(nv50 GPU in my case):

commit f553b79c03f0dbd52f6f03abe8233a2bef8cbd0d
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Wed Dec 21 18:09:12 2011 +1000

drm/nouveau/i2c: handle bit-banging ourselves

Along with the many kernels I built and tested during bisection, I've also
verified this broke sensors detecting on mainline builds of 3.3.8, 3.4.29,
3.7.3 and the current Nouveau git master.

I can verify proper PWM fan control/i2c enumeration on kernel 3.2.35 and
3.2.38. I've not tested earlier kernels than the 3.2 series, but git bisection
went back to 3.2-rc1 and was working there.

I'm happy to provide any further testing to help expedite getting this patched
for stable kernels. I'm particularly interested in the 3.4.x LTS series which
is what led me to discover this issue on my system after I strayed from the
happy confines of the Debian 3.2.x LTS series kernel.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1360625130.bB0C01.15419
Date: Mon, 11 Feb 2013 23:25:30 +0000
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
   title="NEW --- - [nouveau, git regression] - I2C PWM fan control broken on nv50 adt7475 on kernels 3.3.x+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60704">60704</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nouveau, git regression] - I2C PWM fan control broken on nv50 adt7475 on kernels 3.3.x+
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
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
          <td>m.meledandri&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=74657" name="attach_74657" title="ic2-bit-banging-nouveau-git-bisect.log">attachment 74657</a> <a href="attachment.cgi?id=74657&amp;action=edit" title="ic2-bit-banging-nouveau-git-bisect.log">[details]</a></span>
ic2-bit-banging-nouveau-git-bisect.log

When resuming from suspend on affected kernels the lack of fan pwm control
causes the GPU fan to run at 100%. This is noisy, annoying and inefficient.

After performing a git bisect (attached), I've determined the commit that broke
pwm fan control functionality for all kernels 3.3.x+ with adt7475 controller
(nv50 GPU in my case):

commit f553b79c03f0dbd52f6f03abe8233a2bef8cbd0d
Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
Date:   Wed Dec 21 18:09:12 2011 +1000

drm/nouveau/i2c: handle bit-banging ourselves

Along with the many kernels I built and tested during bisection, I've also
verified this broke sensors detecting on mainline builds of 3.3.8, 3.4.29,
3.7.3 and the current Nouveau git master.

I can verify proper PWM fan control/i2c enumeration on kernel 3.2.35 and
3.2.38. I've not tested earlier kernels than the 3.2 series, but git bisection
went back to 3.2-rc1 and was working there.

I'm happy to provide any further testing to help expedite getting this patched
for stable kernels. I'm particularly interested in the 3.4.x LTS series which
is what led me to discover this issue on my system after I strayed from the
happy confines of the Debian 3.2.x LTS series kernel.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1360625130.bB0C01.15419--

--===============0879872138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0879872138==--
