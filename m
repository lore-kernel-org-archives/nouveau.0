From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73744] [NVA8] Constant lock ups with NVIDIA GeForce
	8400 GS
Date: Sat, 18 Jan 2014 22:50:53 +0000
Message-ID: <bug-73744-8800-iejuGB9Nuc@http.bugs.freedesktop.org/>
References: <bug-73744-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0169908617=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73744-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0169908617==
Content-Type: multipart/alternative; boundary="1390085453.81112aC01.20333"; charset="us-ascii"


--1390085453.81112aC01.20333
Date: Sat, 18 Jan 2014 22:50:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73744

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, yeah, it's not at all the thing I thought it might be -- your PCOPY engine
is intact:

$ lookup -a a8 1540 f2010001
PBUS.HWUNITS_0 => { TPC_MASK = 0x1 | PART_MASK = 0x1 | MP_MASK = 0x2 | UNK28 |
UNK29 | VDEC | UNK31 }
$ lookup -a a8 154c 0000023d
PBUS.HWUNITS_1 => { PCIE_VERSION = 2 | PCI_CLASS = DISPLAY | PDISPLAY | UNK3 =
0x3 | PVLD | PCIE_SPEED = 2P5GT | PCOPY }

So... it's something else. Sorry, that's of little help to you.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390085453.81112aC01.20333
Date: Sat, 18 Jan 2014 22:50:53 +0000
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
   title="NEW --- - [NVA8] Constant lock ups with NVIDIA GeForce 8400 GS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73744#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] Constant lock ups with NVIDIA GeForce 8400 GS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73744">bug 73744</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, yeah, it's not at all the thing I thought it might be -- your PCOPY engine
is intact:

$ lookup -a a8 1540 f2010001
PBUS.HWUNITS_0 =&gt; { TPC_MASK = 0x1 | PART_MASK = 0x1 | MP_MASK = 0x2 | UNK28 |
UNK29 | VDEC | UNK31 }
$ lookup -a a8 154c 0000023d
PBUS.HWUNITS_1 =&gt; { PCIE_VERSION = 2 | PCI_CLASS = DISPLAY | PDISPLAY | UNK3 =
0x3 | PVLD | PCIE_SPEED = 2P5GT | PCOPY }

So... it's something else. Sorry, that's of little help to you.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390085453.81112aC01.20333--

--===============0169908617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0169908617==--
