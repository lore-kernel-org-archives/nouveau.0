From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60680] [NV96] HDMI is connected and has mode,
 TV says "no signal"
Date: Sun, 22 Sep 2013 19:08:58 +0000
Message-ID: <bug-60680-8800-VW8htA9jqF@http.bugs.freedesktop.org/>
References: <bug-60680-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1530484044=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60680-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1530484044==
Content-Type: multipart/alternative; boundary="1379876938.AEcfb8cb3.10431"; charset="us-ascii"


--1379876938.AEcfb8cb3.10431
Date: Sun, 22 Sep 2013 19:08:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60680

--- Comment #13 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
A few observations from running

diff -u <(grep -P '(PDISPLAY|MARK)' good/demmio | sed 's/.*MMIO//')  <(grep -P
'(PDISPLAY|MARK)' bad/demmio | sed 's/.*MMIO//')

(the demmio files are envytools/rnn/demmio -f good/mydump.txt > good/demmio)

These largely look the same. However the "good" trace has three sequences that
don't appear in the "bad" trace:

1. A bunch of reads from a bunch of registers, towards the very beginning.

2. Some SOR clock setting:

 32 W 0x61c814 0x00000000 PDISPLAY.SOR[0x1].PLL2 <= 0
 32 R 0x61c90c 0x00401100 PDISPLAY.SOR[0x1].LINK[0].DP_CTRL => { LANE_MASK = 0
| TRAINING_PATTERN = DISABLED | 0x401100 }
 32 W 0x61c90c 0x00401101 PDISPLAY.SOR[0x1].LINK[0].DP_CTRL <= { LANE_MASK = 0
| TRAINING_PATTERN = DISABLED | 0x401101 }
-32 R 0x619494 0x000900e0 PDISPLAY.VGA.CR+0x94 => 0x900e0
 32 R 0x614b00 0x00870484 PDISPLAY.CLOCK.SOR[0x1] => 0x870484
-32 W 0x614b00 0x03870484 PDISPLAY.CLOCK.SOR[0x1] <= 0x3870484
-32 R 0x614b00 0x03870484 PDISPLAY.CLOCK.SOR[0x1] => 0x3870484
-32 R 0x61c80c 0x01000000 PDISPLAY.SOR[0x1].PLL0 => 0x1000000
-32 W 0x61c80c 0x00000000 PDISPLAY.SOR[0x1].PLL0 <= 0
-32 R 0x61c808 0x00800000 PDISPLAY.SOR[0x1]+0x8 => 0x800000
-32 W 0x61c808 0x14800000 PDISPLAY.SOR[0x1]+0x8 <= 0x14800000
-32 R 0x61c808 0x14800000 PDISPLAY.SOR[0x1]+0x8 => 0x14800000
-32 W 0x61c808 0x00800000 PDISPLAY.SOR[0x1]+0x8 <= 0x800000
-32 R 0x61c80c 0x00000000 PDISPLAY.SOR[0x1].PLL0 => 0
-32 W 0x61c80c 0x01000000 PDISPLAY.SOR[0x1].PLL0 <= 0x1000000
-32 R 0x61c840 0x1f000000 PDISPLAY.SOR[0x1].SEQ_INST[0] => 0x1f000000
-32 W 0x61c840 0x1f008000 PDISPLAY.SOR[0x1].SEQ_INST[0] <= 0x1f008000
-32 R 0x614b00 0x03870484 PDISPLAY.CLOCK.SOR[0x1] => 0x3870484
-32 W 0x614b00 0x03870080 PDISPLAY.CLOCK.SOR[0x1] <= 0x3870080
+32 W 0x614b00 0x00870080 PDISPLAY.CLOCK.SOR[0x1] <= 0x870080
 32 W 0x610024 0x00000020 PDISPLAY.INTR_1 <= { CLK_UNK1 }
 32 W 0x610030 0x80000000 PDISPLAY.UNK30_CTRL <= { PENDING }
 32 R 0x610020 0x00000000 PDISPLAY.INTR_0 => { 0 }

3. A bunch of times, this same sequence is repeated:

 32 R 0x610020 0x00000000 PDISPLAY.INTR_0 => { 0 }
 32 R 0x610024 0x00000040 PDISPLAY.INTR_1 => { CLK_UNK2 }
 32 R 0x610030 0x00000550 PDISPLAY.UNK30_CTRL => { UPDATE_VCLK1 | 0x150 }
-32 R 0x619494 0x000900e0 PDISPLAY.VGA.CR+0x94 => 0x900e0
-32 R 0x61c860 0x00002000 PDISPLAY.SOR[0x1].SEQ_INST[0x8] => 0x2000
-32 W 0x61c860 0x1f008000 PDISPLAY.SOR[0x1].SEQ_INST[0x8] <= 0x1f008000
-32 W 0x61c804 0x80000000 PDISPLAY.SOR[0x1].PWR <= { NORMAL_STATE = PD |
NORMAL_START = NORMAL | SAFE_STATE = PD | SAFE_START = NORMAL | TRIGGER }
-32 R 0x61c804 0x00000000 PDISPLAY.SOR[0x1].PWR => { NORMAL_STATE = PD |
NORMAL_START = NORMAL | SAFE_STATE = PD | SAFE_START = NORMAL }
-32 R 0x61c804 0x00000000 PDISPLAY.SOR[0x1].PWR => { NORMAL_STATE = PD |
NORMAL_START = NORMAL | SAFE_STATE = PD | SAFE_START = NORMAL }
-32 R 0x61c830 0x00088800 PDISPLAY.SOR[0x1].BLANK => 0x88800
-32 R 0x61c830 0x00088800 PDISPLAY.SOR[0x1].BLANK => 0x88800
-32 R 0x61c840 0x1f008000 PDISPLAY.SOR[0x1].SEQ_INST[0] => 0x1f008000
-32 W 0x61c840 0x1f000000 PDISPLAY.SOR[0x1].SEQ_INST[0] <= 0x1f000000
-32 R 0x61c860 0x1f008000 PDISPLAY.SOR[0x1].SEQ_INST[0x8] => 0x1f008000
-32 W 0x61c860 0x00002000 PDISPLAY.SOR[0x1].SEQ_INST[0x8] <= 0x2000
-32 R 0x61c90c 0x00401101 PDISPLAY.SOR[0x1].LINK[0].DP_CTRL => { LANE_MASK = 0
| TRAINING_PATTERN = DISABLED | 0x401101 }
-32 W 0x61c90c 0x00401100 PDISPLAY.SOR[0x1].LINK[0].DP_CTRL <= { LANE_MASK = 0
| TRAINING_PATTERN = DISABLED | 0x401100 }
-32 R 0x614b00 0x03878040 PDISPLAY.CLOCK.SOR[0x1] => 0x3878040
-32 W 0x614b00 0x00878040 PDISPLAY.CLOCK.SOR[0x1] <= 0x878040
-32 W 0x61c804 0x80000001 PDISPLAY.SOR[0x1].PWR <= { NORMAL_STATE = PU |
NORMAL_START = NORMAL | SAFE_STATE = PD | SAFE_START = NORMAL | TRIGGER }
-32 R 0x61c804 0x00000001 PDISPLAY.SOR[0x1].PWR => { NORMAL_STATE = PU |
NORMAL_START = NORMAL | SAFE_STATE = PD | SAFE_START = NORMAL }
-32 R 0x61c804 0x00000001 PDISPLAY.SOR[0x1].PWR => { NORMAL_STATE = PU |
NORMAL_START = NORMAL | SAFE_STATE = PD | SAFE_START = NORMAL }
-32 R 0x61c830 0x00038800 PDISPLAY.SOR[0x1].BLANK => 0x38800
-32 R 0x61c830 0x00038800 PDISPLAY.SOR[0x1].BLANK => 0x38800
 32 W 0x610024 0x00000040 PDISPLAY.INTR_1 <= { CLK_UNK2 }
 32 W 0x610030 0x80000000 PDISPLAY.UNK30_CTRL <= { PENDING }
 32 R 0x619494 0x000900e0 PDISPLAY.VGA.CR+0x94 => 0x900e0

There are a few other minor discrepancies, but I don't think they're very
interesting. Not sure what to make of this -- these reigsters don't appear to
be written to by the code directly, so it must be some sort of script getting
executed? I wonder if the extra SOR.PLL/etc stuff (from #2 above) need to go
into the NV50_DISP_SOR_PWR sequence. Or perhaps there's some sort of difference
in the evo stuff, which I don't think is reflected in the mmiotrace.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1379876938.AEcfb8cb3.10431
Date: Sun, 22 Sep 2013 19:08:58 +0000
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
   title="NEW --- - [NV96] HDMI is connected and has mode, TV says &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60680#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] HDMI is connected and has mode, TV says &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60680">bug 60680</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>A few observations from running

diff -u &lt;(grep -P '(PDISPLAY|MARK)' good/demmio | sed 's/.*MMIO//')  &lt;(grep -P
'(PDISPLAY|MARK)' bad/demmio | sed 's/.*MMIO//')

(the demmio files are envytools/rnn/demmio -f good/mydump.txt &gt; good/demmio)

These largely look the same. However the &quot;good&quot; trace has three sequences that
don't appear in the &quot;bad&quot; trace:

1. A bunch of reads from a bunch of registers, towards the very beginning.

2. Some SOR clock setting:

 32 W 0x61c814 0x00000000 PDISPLAY.SOR[0x1].PLL2 &lt;= 0
 32 R 0x61c90c 0x00401100 PDISPLAY.SOR[0x1].LINK[0].DP_CTRL =&gt; { LANE_MASK = 0
| TRAINING_PATTERN = DISABLED | 0x401100 }
 32 W 0x61c90c 0x00401101 PDISPLAY.SOR[0x1].LINK[0].DP_CTRL &lt;= { LANE_MASK = 0
| TRAINING_PATTERN = DISABLED | 0x401101 }
-32 R 0x619494 0x000900e0 PDISPLAY.VGA.CR+0x94 =&gt; 0x900e0
 32 R 0x614b00 0x00870484 PDISPLAY.CLOCK.SOR[0x1] =&gt; 0x870484
-32 W 0x614b00 0x03870484 PDISPLAY.CLOCK.SOR[0x1] &lt;= 0x3870484
-32 R 0x614b00 0x03870484 PDISPLAY.CLOCK.SOR[0x1] =&gt; 0x3870484
-32 R 0x61c80c 0x01000000 PDISPLAY.SOR[0x1].PLL0 =&gt; 0x1000000
-32 W 0x61c80c 0x00000000 PDISPLAY.SOR[0x1].PLL0 &lt;= 0
-32 R 0x61c808 0x00800000 PDISPLAY.SOR[0x1]+0x8 =&gt; 0x800000
-32 W 0x61c808 0x14800000 PDISPLAY.SOR[0x1]+0x8 &lt;= 0x14800000
-32 R 0x61c808 0x14800000 PDISPLAY.SOR[0x1]+0x8 =&gt; 0x14800000
-32 W 0x61c808 0x00800000 PDISPLAY.SOR[0x1]+0x8 &lt;= 0x800000
-32 R 0x61c80c 0x00000000 PDISPLAY.SOR[0x1].PLL0 =&gt; 0
-32 W 0x61c80c 0x01000000 PDISPLAY.SOR[0x1].PLL0 &lt;= 0x1000000
-32 R 0x61c840 0x1f000000 PDISPLAY.SOR[0x1].SEQ_INST[0] =&gt; 0x1f000000
-32 W 0x61c840 0x1f008000 PDISPLAY.SOR[0x1].SEQ_INST[0] &lt;= 0x1f008000
-32 R 0x614b00 0x03870484 PDISPLAY.CLOCK.SOR[0x1] =&gt; 0x3870484
-32 W 0x614b00 0x03870080 PDISPLAY.CLOCK.SOR[0x1] &lt;= 0x3870080
+32 W 0x614b00 0x00870080 PDISPLAY.CLOCK.SOR[0x1] &lt;= 0x870080
 32 W 0x610024 0x00000020 PDISPLAY.INTR_1 &lt;= { CLK_UNK1 }
 32 W 0x610030 0x80000000 PDISPLAY.UNK30_CTRL &lt;= { PENDING }
 32 R 0x610020 0x00000000 PDISPLAY.INTR_0 =&gt; { 0 }

3. A bunch of times, this same sequence is repeated:

 32 R 0x610020 0x00000000 PDISPLAY.INTR_0 =&gt; { 0 }
 32 R 0x610024 0x00000040 PDISPLAY.INTR_1 =&gt; { CLK_UNK2 }
 32 R 0x610030 0x00000550 PDISPLAY.UNK30_CTRL =&gt; { UPDATE_VCLK1 | 0x150 }
-32 R 0x619494 0x000900e0 PDISPLAY.VGA.CR+0x94 =&gt; 0x900e0
-32 R 0x61c860 0x00002000 PDISPLAY.SOR[0x1].SEQ_INST[0x8] =&gt; 0x2000
-32 W 0x61c860 0x1f008000 PDISPLAY.SOR[0x1].SEQ_INST[0x8] &lt;= 0x1f008000
-32 W 0x61c804 0x80000000 PDISPLAY.SOR[0x1].PWR &lt;= { NORMAL_STATE = PD |
NORMAL_START = NORMAL | SAFE_STATE = PD | SAFE_START = NORMAL | TRIGGER }
-32 R 0x61c804 0x00000000 PDISPLAY.SOR[0x1].PWR =&gt; { NORMAL_STATE = PD |
NORMAL_START = NORMAL | SAFE_STATE = PD | SAFE_START = NORMAL }
-32 R 0x61c804 0x00000000 PDISPLAY.SOR[0x1].PWR =&gt; { NORMAL_STATE = PD |
NORMAL_START = NORMAL | SAFE_STATE = PD | SAFE_START = NORMAL }
-32 R 0x61c830 0x00088800 PDISPLAY.SOR[0x1].BLANK =&gt; 0x88800
-32 R 0x61c830 0x00088800 PDISPLAY.SOR[0x1].BLANK =&gt; 0x88800
-32 R 0x61c840 0x1f008000 PDISPLAY.SOR[0x1].SEQ_INST[0] =&gt; 0x1f008000
-32 W 0x61c840 0x1f000000 PDISPLAY.SOR[0x1].SEQ_INST[0] &lt;= 0x1f000000
-32 R 0x61c860 0x1f008000 PDISPLAY.SOR[0x1].SEQ_INST[0x8] =&gt; 0x1f008000
-32 W 0x61c860 0x00002000 PDISPLAY.SOR[0x1].SEQ_INST[0x8] &lt;= 0x2000
-32 R 0x61c90c 0x00401101 PDISPLAY.SOR[0x1].LINK[0].DP_CTRL =&gt; { LANE_MASK = 0
| TRAINING_PATTERN = DISABLED | 0x401101 }
-32 W 0x61c90c 0x00401100 PDISPLAY.SOR[0x1].LINK[0].DP_CTRL &lt;= { LANE_MASK = 0
| TRAINING_PATTERN = DISABLED | 0x401100 }
-32 R 0x614b00 0x03878040 PDISPLAY.CLOCK.SOR[0x1] =&gt; 0x3878040
-32 W 0x614b00 0x00878040 PDISPLAY.CLOCK.SOR[0x1] &lt;= 0x878040
-32 W 0x61c804 0x80000001 PDISPLAY.SOR[0x1].PWR &lt;= { NORMAL_STATE = PU |
NORMAL_START = NORMAL | SAFE_STATE = PD | SAFE_START = NORMAL | TRIGGER }
-32 R 0x61c804 0x00000001 PDISPLAY.SOR[0x1].PWR =&gt; { NORMAL_STATE = PU |
NORMAL_START = NORMAL | SAFE_STATE = PD | SAFE_START = NORMAL }
-32 R 0x61c804 0x00000001 PDISPLAY.SOR[0x1].PWR =&gt; { NORMAL_STATE = PU |
NORMAL_START = NORMAL | SAFE_STATE = PD | SAFE_START = NORMAL }
-32 R 0x61c830 0x00038800 PDISPLAY.SOR[0x1].BLANK =&gt; 0x38800
-32 R 0x61c830 0x00038800 PDISPLAY.SOR[0x1].BLANK =&gt; 0x38800
 32 W 0x610024 0x00000040 PDISPLAY.INTR_1 &lt;= { CLK_UNK2 }
 32 W 0x610030 0x80000000 PDISPLAY.UNK30_CTRL &lt;= { PENDING }
 32 R 0x619494 0x000900e0 PDISPLAY.VGA.CR+0x94 =&gt; 0x900e0

There are a few other minor discrepancies, but I don't think they're very
interesting. Not sure what to make of this -- these reigsters don't appear to
be written to by the code directly, so it must be some sort of script getting
executed? I wonder if the extra SOR.PLL/etc stuff (from #2 above) need to go
into the NV50_DISP_SOR_PWR sequence. Or perhaps there's some sort of difference
in the evo stuff, which I don't think is reflected in the mmiotrace.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1379876938.AEcfb8cb3.10431--

--===============1530484044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1530484044==--
