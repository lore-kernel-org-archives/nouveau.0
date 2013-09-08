From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69083] [NV84] specifying higher than EDID-preferred
 4:3 mode on DVI-I -> VGA adapter causes output to be compressed into small
 fraction of CRT's top scan lines
Date: Sun, 08 Sep 2013 09:32:02 +0000
Message-ID: <bug-69083-8800-2CQJKnpwgE@http.bugs.freedesktop.org/>
References: <bug-69083-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0409222840=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69083-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0409222840==
Content-Type: multipart/alternative; boundary="1378632721.d82a1.14676"; charset="us-ascii"


--1378632721.d82a1.14676
Date: Sun, 8 Sep 2013 09:32:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69083

Felix Miata <mrmazda-ihVZJaRskl1bRRN4PJnoQQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[NV84] Using 1920x1440 mode |[NV84] specifying higher
                   |on DVI-I -> VGA adapter     |than EDID-preferred 4:3
                   |causes output to be         |mode on DVI-I -> VGA
                   |compressed into small       |adapter causes output to be
                   |fraction of top scan lines  |compressed into small
                   |                            |fraction of CRT's top scan
                   |                            |lines

--- Comment #6 from Felix Miata <mrmazda-ihVZJaRskl1bRRN4PJnoQQ@public.gmane.org> ---
1920x1440 was an example of a broken mode >EDID preferred. The broader
description is xorg.conf* PreferredMode is broken WRT all traditional 4:3 modes
higher than the EDID preferred mode, same as those modes set via xrandr -s.
Other broken modes on this FE2111SB/G84 combination include 1792x1344 and
1856x1392, proven using comment 4 method. Interestingly, this CRT has
previously proven to have no objection to non-4:3 modes, and 'xrandr -s
1920x1200 -r 60 && sleep 10 && xrandr -s 1600x1200' does not produce this bug,
just a normal 1920x1200 squeezed into a 4:3 space for the sleep duration.
1920x1080, 1440x900 and 1680x1050 also work in same manner. Both 1920x1200 and
1920x1080 (and presumably 1440x900 and 1680x1050) work via PreferredMode as
well.

Considering the dozens of gfxchips using non-nouveau drivers I've connected via
VGA outputs to this CRT exhibiting no such trouble, I doubt EDID is the root.
Using this very same G84 and DVI to VGA adapter with nv driver and disabled KMS
this CRT works as well as Intel and Radeon and even does 2048x1536@60.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378632721.d82a1.14676
Date: Sun, 8 Sep 2013 09:32:01 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:mrmazda&#64;earthlink.net" title="Felix Miata &lt;mrmazda&#64;earthlink.net&gt;"> <span class="fn">Felix Miata</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV84] specifying higher than EDID-preferred 4:3 mode on DVI-I -&gt; VGA adapter causes output to be compressed into small fraction of CRT's top scan lines"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69083">bug 69083</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>[NV84] Using 1920x1440 mode on DVI-I -&gt; VGA adapter causes output to be compressed into small fraction of top scan lines
           </td>
           <td>[NV84] specifying higher than EDID-preferred 4:3 mode on DVI-I -&gt; VGA adapter causes output to be compressed into small fraction of CRT's top scan lines
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV84] specifying higher than EDID-preferred 4:3 mode on DVI-I -&gt; VGA adapter causes output to be compressed into small fraction of CRT's top scan lines"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69083#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV84] specifying higher than EDID-preferred 4:3 mode on DVI-I -&gt; VGA adapter causes output to be compressed into small fraction of CRT's top scan lines"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69083">bug 69083</a>
              from <span class="vcard"><a class="email" href="mailto:mrmazda&#64;earthlink.net" title="Felix Miata &lt;mrmazda&#64;earthlink.net&gt;"> <span class="fn">Felix Miata</span></a>
</span></b>
        <pre>1920x1440 was an example of a broken mode &gt;EDID preferred. The broader
description is xorg.conf* PreferredMode is broken WRT all traditional 4:3 modes
higher than the EDID preferred mode, same as those modes set via xrandr -s.
Other broken modes on this FE2111SB/G84 combination include 1792x1344 and
1856x1392, proven using <a href="show_bug.cgi?id=69083#c4">comment 4</a> method. Interestingly, this CRT has
previously proven to have no objection to non-4:3 modes, and 'xrandr -s
1920x1200 -r 60 &amp;&amp; sleep 10 &amp;&amp; xrandr -s 1600x1200' does not produce this bug,
just a normal 1920x1200 squeezed into a 4:3 space for the sleep duration.
1920x1080, 1440x900 and 1680x1050 also work in same manner. Both 1920x1200 and
1920x1080 (and presumably 1440x900 and 1680x1050) work via PreferredMode as
well.

Considering the dozens of gfxchips using non-nouveau drivers I've connected via
VGA outputs to this CRT exhibiting no such trouble, I doubt EDID is the root.
Using this very same G84 and DVI to VGA adapter with nv driver and disabled KMS
this CRT works as well as Intel and Radeon and even does 2048x1536&#64;60.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378632721.d82a1.14676--

--===============0409222840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0409222840==--
