From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Sun, 28 Jul 2013 19:00:08 +0000
Message-ID: <bug-54700-8800-YeuK7YgMNk@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0742824992=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0742824992==
Content-Type: multipart/alternative; boundary="1375038007.efFc1.31681"; charset="us-ascii"


--1375038007.efFc1.31681
Date: Sun, 28 Jul 2013 19:00:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #47 from r.ductor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Hi

1) I've downloaded an image of fractal and I've used this script

#!/bin/bash

BAN="fractal"
EXT="jpg"

for i in {001..100};do
/usr/bin/convert "${BAN}.${EXT}" -resize "${i}%" -set filename:wh "%wx%h"
"${BAN}_${i}_%[filename:wh].${EXT}"
done

to create 100 samples
$ ls
fractal_001_19x11.jpg    fractal_011_211x119.jpg  fractal_021_403x227.jpg 
fractal_031_595x335.jpg  fractal_041_787x443.jpg  fractal_051_979x551.jpg  
fractal_061_1171x659.jpg  fractal_071_1363x767.jpg  fractal_081_1555x875.jpg 
fractal_091_1747x983.jpg   fractal.jpg
fractal_002_38x22.jpg    fractal_012_230x130.jpg  fractal_022_422x238.jpg 
fractal_032_614x346.jpg  fractal_042_806x454.jpg  fractal_052_998x562.jpg  
fractal_062_1190x670.jpg  fractal_072_1382x778.jpg  fractal_082_1574x886.jpg 
fractal_092_1766x994.jpg
fractal_003_58x32.jpg    fractal_013_250x140.jpg  fractal_023_442x248.jpg 
fractal_033_634x356.jpg  fractal_043_826x464.jpg  fractal_053_1018x572.jpg 
fractal_063_1210x680.jpg  fractal_073_1402x788.jpg  fractal_083_1594x896.jpg 
fractal_093_1786x1004.jpg
fractal_004_77x43.jpg    fractal_014_269x151.jpg  fractal_024_461x259.jpg 
fractal_034_653x367.jpg  fractal_044_845x475.jpg  fractal_054_1037x583.jpg 
fractal_064_1229x691.jpg  fractal_074_1421x799.jpg  fractal_084_1613x907.jpg 
fractal_094_1805x1015.jpg
fractal_005_96x54.jpg    fractal_015_288x162.jpg  fractal_025_480x270.jpg 
fractal_035_672x378.jpg  fractal_045_864x486.jpg  fractal_055_1056x594.jpg 
fractal_065_1248x702.jpg  fractal_075_1440x810.jpg  fractal_085_1632x918.jpg 
fractal_095_1824x1026.jpg
fractal_006_115x65.jpg   fractal_016_307x173.jpg  fractal_026_499x281.jpg 
fractal_036_691x389.jpg  fractal_046_883x497.jpg  fractal_056_1075x605.jpg 
fractal_066_1267x713.jpg  fractal_076_1459x821.jpg  fractal_086_1651x929.jpg 
fractal_096_1843x1037.jpg
fractal_007_134x76.jpg   fractal_017_326x184.jpg  fractal_027_518x292.jpg 
fractal_037_710x400.jpg  fractal_047_902x508.jpg  fractal_057_1094x616.jpg 
fractal_067_1286x724.jpg  fractal_077_1478x832.jpg  fractal_087_1670x940.jpg 
fractal_097_1862x1048.jpg
fractal_008_154x86.jpg   fractal_018_346x194.jpg  fractal_028_538x302.jpg 
fractal_038_730x410.jpg  fractal_048_922x518.jpg  fractal_058_1114x626.jpg 
fractal_068_1306x734.jpg  fractal_078_1498x842.jpg  fractal_088_1690x950.jpg 
fractal_098_1882x1058.jpg
fractal_009_173x97.jpg   fractal_019_365x205.jpg  fractal_029_557x313.jpg 
fractal_039_749x421.jpg  fractal_049_941x529.jpg  fractal_059_1133x637.jpg 
fractal_069_1325x745.jpg  fractal_079_1517x853.jpg  fractal_089_1709x961.jpg 
fractal_099_1901x1069.jpg
fractal_010_192x108.jpg  fractal_020_384x216.jpg  fractal_030_576x324.jpg 
fractal_040_768x432.jpg  fractal_050_960x540.jpg  fractal_060_1152x648.jpg 
fractal_070_1344x756.jpg  fractal_080_1536x864.jpg  fractal_090_1728x972.jpg 
fractal_100_1920x1080.jpg

I've do the same for fractal2, a different fractal (png) 

2) opening the samples with iceweasel all gets well while the image is not
rescaled by iceweasel: if the image is rescaled by iw then is rendered
corrupted; if I enlarge the window (or zoom in) the image is rendered OK. See
attachments fractal97 and fractal2.....  I'm confused, I cannot find what Emil
asked, i.e. a transition point in sizes from which distortion starts, seems
more an iceweasel bug. See also attachment "looking for iceweasel logo". 

3) the problem of corruption from rescaling to built-in viewers seems not there
with the built in konqueror viewer and gwenviewer....

4) running the various tests I got 2 crashes (black screen) :(((( see dmesg in
attachment

5) to test the graphics in framebuffer, I've installed links2 (
http://links.twibright.com/ ) which is a web browser with graphic capabilities
working also in framebuffer. Output is 100% corrupted, see photos attachments.
(Of course I do not know if this is a link2 problem. I attached the console
error output of links2.

Regards
ric
(I'll disappear for 3 weeks sorry)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375038007.efFc1.31681
Date: Sun, 28 Jul 2013 19:00:07 +0000
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
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c47">Comment # 47</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:r.ductor&#64;gmail.com" title="r.ductor&#64;gmail.com">r.ductor&#64;gmail.com</a>
</span></b>
        <pre>Hi

1) I've downloaded an image of fractal and I've used this script

#!/bin/bash

BAN=&quot;fractal&quot;
EXT=&quot;jpg&quot;

for i in {001..100};do
/usr/bin/convert &quot;${BAN}.${EXT}&quot; -resize &quot;${i}%&quot; -set filename:wh &quot;%wx%h&quot;
&quot;${BAN}_${i}_%[filename:wh].${EXT}&quot;
done

to create 100 samples
$ ls
fractal_001_19x11.jpg    fractal_011_211x119.jpg  fractal_021_403x227.jpg 
fractal_031_595x335.jpg  fractal_041_787x443.jpg  fractal_051_979x551.jpg  
fractal_061_1171x659.jpg  fractal_071_1363x767.jpg  fractal_081_1555x875.jpg 
fractal_091_1747x983.jpg   fractal.jpg
fractal_002_38x22.jpg    fractal_012_230x130.jpg  fractal_022_422x238.jpg 
fractal_032_614x346.jpg  fractal_042_806x454.jpg  fractal_052_998x562.jpg  
fractal_062_1190x670.jpg  fractal_072_1382x778.jpg  fractal_082_1574x886.jpg 
fractal_092_1766x994.jpg
fractal_003_58x32.jpg    fractal_013_250x140.jpg  fractal_023_442x248.jpg 
fractal_033_634x356.jpg  fractal_043_826x464.jpg  fractal_053_1018x572.jpg 
fractal_063_1210x680.jpg  fractal_073_1402x788.jpg  fractal_083_1594x896.jpg 
fractal_093_1786x1004.jpg
fractal_004_77x43.jpg    fractal_014_269x151.jpg  fractal_024_461x259.jpg 
fractal_034_653x367.jpg  fractal_044_845x475.jpg  fractal_054_1037x583.jpg 
fractal_064_1229x691.jpg  fractal_074_1421x799.jpg  fractal_084_1613x907.jpg 
fractal_094_1805x1015.jpg
fractal_005_96x54.jpg    fractal_015_288x162.jpg  fractal_025_480x270.jpg 
fractal_035_672x378.jpg  fractal_045_864x486.jpg  fractal_055_1056x594.jpg 
fractal_065_1248x702.jpg  fractal_075_1440x810.jpg  fractal_085_1632x918.jpg 
fractal_095_1824x1026.jpg
fractal_006_115x65.jpg   fractal_016_307x173.jpg  fractal_026_499x281.jpg 
fractal_036_691x389.jpg  fractal_046_883x497.jpg  fractal_056_1075x605.jpg 
fractal_066_1267x713.jpg  fractal_076_1459x821.jpg  fractal_086_1651x929.jpg 
fractal_096_1843x1037.jpg
fractal_007_134x76.jpg   fractal_017_326x184.jpg  fractal_027_518x292.jpg 
fractal_037_710x400.jpg  fractal_047_902x508.jpg  fractal_057_1094x616.jpg 
fractal_067_1286x724.jpg  fractal_077_1478x832.jpg  fractal_087_1670x940.jpg 
fractal_097_1862x1048.jpg
fractal_008_154x86.jpg   fractal_018_346x194.jpg  fractal_028_538x302.jpg 
fractal_038_730x410.jpg  fractal_048_922x518.jpg  fractal_058_1114x626.jpg 
fractal_068_1306x734.jpg  fractal_078_1498x842.jpg  fractal_088_1690x950.jpg 
fractal_098_1882x1058.jpg
fractal_009_173x97.jpg   fractal_019_365x205.jpg  fractal_029_557x313.jpg 
fractal_039_749x421.jpg  fractal_049_941x529.jpg  fractal_059_1133x637.jpg 
fractal_069_1325x745.jpg  fractal_079_1517x853.jpg  fractal_089_1709x961.jpg 
fractal_099_1901x1069.jpg
fractal_010_192x108.jpg  fractal_020_384x216.jpg  fractal_030_576x324.jpg 
fractal_040_768x432.jpg  fractal_050_960x540.jpg  fractal_060_1152x648.jpg 
fractal_070_1344x756.jpg  fractal_080_1536x864.jpg  fractal_090_1728x972.jpg 
fractal_100_1920x1080.jpg

I've do the same for fractal2, a different fractal (png) 

2) opening the samples with iceweasel all gets well while the image is not
rescaled by iceweasel: if the image is rescaled by iw then is rendered
corrupted; if I enlarge the window (or zoom in) the image is rendered OK. See
attachments fractal97 and fractal2.....  I'm confused, I cannot find what Emil
asked, i.e. a transition point in sizes from which distortion starts, seems
more an iceweasel bug. See also attachment &quot;looking for iceweasel logo&quot;. 

3) the problem of corruption from rescaling to built-in viewers seems not there
with the built in konqueror viewer and gwenviewer....

4) running the various tests I got 2 crashes (black screen) :(((( see dmesg in
<span class=""><a href="attachment.cgi?id=5" name="attach_5" title="fontconfig-opt-hashed-lang.patch">attachment

5</a> <a href="attachment.cgi?id=5&amp;action=edit" title="fontconfig-opt-hashed-lang.patch">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=54700&amp;attachment=5'>[review]</a>) to test the graphics in framebuffer, I've installed links2 (
<a href="http://links.twibright.com/">http://links.twibright.com/</a> ) which is a web browser with graphic capabilities
working also in framebuffer. Output is 100% corrupted, see photos attachments.
(Of course I do not know if this is a link2 problem. I attached the console
error output of links2.

Regards
ric
(I'll disappear for 3 weeks sorry)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375038007.efFc1.31681--

--===============0742824992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0742824992==--
