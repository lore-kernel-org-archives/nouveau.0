From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76483] [NV50, bisected,
 RFC patch] xset dpms force {on, off} does not work over DP
Date: Wed, 25 Jun 2014 05:44:08 +0000
Message-ID: <bug-76483-8800-rY01c2FNFU@http.bugs.freedesktop.org/>
References: <bug-76483-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1218131496=="
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


--===============1218131496==
Content-Type: multipart/alternative; boundary="1403675048.ac2cB4.17631"; charset="us-ascii"


--1403675048.ac2cB4.17631
Date: Wed, 25 Jun 2014 05:44:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76483

--- Comment #15 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #12)
> Ok.  Not sure what the latest drm-next is, I found a recent looking
> drm-nouveau-next and it did the same thing.
> 
> Monitor is blanked (backlight off) via:
> [  225.790860] nouveau D[     I2C][0000:05:00.0] AUXCH(3): 8: 0x00000600 1
> [  225.790894] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000002
> [  225.790897] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
> [  225.790899] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
> [  225.790901] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
> [  225.791037] nouveau D[     I2C][0000:05:00.0] AUXCH(3): 00 0x01108000
> 0x10000000
> 
> and the unsuccessful attempt to restore backlight is:
> 
> [  251.285375] nouveau D[     I2C][0000:05:00.0] AUXCH(3): 8: 0x00000600 1
> [  251.285388] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000001
> [  251.285391] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
> [  251.285393] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
> [  251.285395] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
> [  251.285529] nouveau D[     I2C][0000:05:00.0] AUXCH(3): 00 0x01108000
> 0x10000000
> 
> Full log attached as it's rather lengthy.  ***NOTE*** lines show when things
> happened.

Can you grab a new log with that patch I just attached applied?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403675048.ac2cB4.17631
Date: Wed, 25 Jun 2014 05:44:08 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76483#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50, bisected, RFC patch] xset dpms force {on,off} does not work over DP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76483">bug 76483</a>
              from <span class="vcard"><a class="email" href="mailto:skeggsb&#64;gmail.com" title="Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> <span class="fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=76483#c12">comment #12</a>)
<span class="quote">&gt; Ok.  Not sure what the latest drm-next is, I found a recent looking
&gt; drm-nouveau-next and it did the same thing.
&gt; 
&gt; Monitor is blanked (backlight off) via:
&gt; [  225.790860] nouveau D[     I2C][0000:05:00.0] AUXCH(3): 8: 0x00000600 1
&gt; [  225.790894] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000002
&gt; [  225.790897] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
&gt; [  225.790899] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
&gt; [  225.790901] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
&gt; [  225.791037] nouveau D[     I2C][0000:05:00.0] AUXCH(3): 00 0x01108000
&gt; 0x10000000
&gt; 
&gt; and the unsuccessful attempt to restore backlight is:
&gt; 
&gt; [  251.285375] nouveau D[     I2C][0000:05:00.0] AUXCH(3): 8: 0x00000600 1
&gt; [  251.285388] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000001
&gt; [  251.285391] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
&gt; [  251.285393] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
&gt; [  251.285395] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
&gt; [  251.285529] nouveau D[     I2C][0000:05:00.0] AUXCH(3): 00 0x01108000
&gt; 0x10000000
&gt; 
&gt; Full log attached as it's rather lengthy.  ***NOTE*** lines show when things
&gt; happened.</span >

Can you grab a new log with that patch I just attached applied?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403675048.ac2cB4.17631--

--===============1218131496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1218131496==--
