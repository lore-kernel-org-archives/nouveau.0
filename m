From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78092] GK208M [GeForce GT 730M] (rev ff) (prog-if
 ff) nouveau module load fail
Date: Wed, 30 Apr 2014 18:47:21 +0000
Message-ID: <bug-78092-8800-UyLWpXx1QD@http.bugs.freedesktop.org/>
References: <bug-78092-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0257226310=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78092-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0257226310==
Content-Type: multipart/alternative; boundary="1398883641.8DCEcEC1.29727"; charset="us-ascii"


--1398883641.8DCEcEC1.29727
Date: Wed, 30 Apr 2014 18:47:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78092

--- Comment #15 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #14)
> I poked further... from my understanding of the code, nouveau_dsm_pci_probe
> is called from within 2 while loops in nouveau_dsm_detect (@ line 275). 
> 
> as nouveau_dsm_pci_probe is never called, I would say, the while condition
> is always false for both loops.

Inconceivable :)

The first while loop should enter that condition twice, for these two devices:

00:02.0 VGA compatible controller [0300]: Intel Corporation 4th Gen Core
Processor Integrated Graphics Controller [8086:0416] (rev 06)
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK208M [GeForce GT
730M] [10de:1290] (rev a1)

The second while loop should not have any effect since you don't have any "3D
controller" devices. Can you double-check that the first while loop never
executes its body? (e.g. put a print before/after/in it, which will confirm
that your code is actually being executed and that it never goes inside.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398883641.8DCEcEC1.29727
Date: Wed, 30 Apr 2014 18:47:21 +0000
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
   title="NEW --- - GK208M [GeForce GT 730M] (rev ff) (prog-if ff) nouveau module load fail"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78092#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - GK208M [GeForce GT 730M] (rev ff) (prog-if ff) nouveau module load fail"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78092">bug 78092</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=78092#c14">comment #14</a>)
<span class="quote">&gt; I poked further... from my understanding of the code, nouveau_dsm_pci_probe
&gt; is called from within 2 while loops in nouveau_dsm_detect (&#64; line 275). 
&gt; 
&gt; as nouveau_dsm_pci_probe is never called, I would say, the while condition
&gt; is always false for both loops.</span >

Inconceivable :)

The first while loop should enter that condition twice, for these two devices:

00:02.0 VGA compatible controller [0300]: Intel Corporation 4th Gen Core
Processor Integrated Graphics Controller [8086:0416] (rev 06)
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK208M [GeForce GT
730M] [10de:1290] (rev a1)

The second while loop should not have any effect since you don't have any &quot;3D
controller&quot; devices. Can you double-check that the first while loop never
executes its body? (e.g. put a print before/after/in it, which will confirm
that your code is actually being executed and that it never goes inside.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398883641.8DCEcEC1.29727--

--===============0257226310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0257226310==--
