From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76483] [NV50, bisected,
 RFC patch] xset dpms force {on, off} does not work over DP
Date: Fri, 20 Jun 2014 13:16:16 +0000
Message-ID: <bug-76483-8800-R1A69HBYts@http.bugs.freedesktop.org/>
References: <bug-76483-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0876279773=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76483-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0876279773==
Content-Type: multipart/alternative; boundary="1403270176.63DB3.21300"; charset="us-ascii"


--1403270176.63DB3.21300
Date: Fri, 20 Jun 2014 13:16:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76483

--- Comment #12 from Karl Schendel <schendel-zf86OBlHRo2+XT7JhA+gdA@public.gmane.org> ---
Ok.  Not sure what the latest drm-next is, I found a recent looking
drm-nouveau-next and it did the same thing.

Monitor is blanked (backlight off) via:
[  225.790860] nouveau D[     I2C][0000:05:00.0] AUXCH(3): 8: 0x00000600 1
[  225.790894] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000002
[  225.790897] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
[  225.790899] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
[  225.790901] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
[  225.791037] nouveau D[     I2C][0000:05:00.0] AUXCH(3): 00 0x01108000
0x10000000

and the unsuccessful attempt to restore backlight is:

[  251.285375] nouveau D[     I2C][0000:05:00.0] AUXCH(3): 8: 0x00000600 1
[  251.285388] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000001
[  251.285391] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
[  251.285393] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
[  251.285395] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
[  251.285529] nouveau D[     I2C][0000:05:00.0] AUXCH(3): 00 0x01108000
0x10000000

Full log attached as it's rather lengthy.  ***NOTE*** lines show when things
happened.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403270176.63DB3.21300
Date: Fri, 20 Jun 2014 13:16:16 +0000
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
   title="NEW --- - [NV50, bisected, RFC patch] xset dpms force {on,off} does not work over DP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76483#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50, bisected, RFC patch] xset dpms force {on,off} does not work over DP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76483">bug 76483</a>
              from <span class="vcard"><a class="email" href="mailto:schendel&#64;kbcomputer.com" title="Karl Schendel &lt;schendel&#64;kbcomputer.com&gt;"> <span class="fn">Karl Schendel</span></a>
</span></b>
        <pre>Ok.  Not sure what the latest drm-next is, I found a recent looking
drm-nouveau-next and it did the same thing.

Monitor is blanked (backlight off) via:
[  225.790860] nouveau D[     I2C][0000:05:00.0] AUXCH(3): 8: 0x00000600 1
[  225.790894] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000002
[  225.790897] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
[  225.790899] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
[  225.790901] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
[  225.791037] nouveau D[     I2C][0000:05:00.0] AUXCH(3): 00 0x01108000
0x10000000

and the unsuccessful attempt to restore backlight is:

[  251.285375] nouveau D[     I2C][0000:05:00.0] AUXCH(3): 8: 0x00000600 1
[  251.285388] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000001
[  251.285391] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
[  251.285393] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
[  251.285395] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
[  251.285529] nouveau D[     I2C][0000:05:00.0] AUXCH(3): 00 0x01108000
0x10000000

Full log attached as it's rather lengthy.  ***NOTE*** lines show when things
happened.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403270176.63DB3.21300--

--===============0876279773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0876279773==--
