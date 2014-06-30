From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76483] [NV50, bisected,
 RFC patch] xset dpms force {on, off} does not work over DP
Date: Mon, 30 Jun 2014 00:53:25 +0000
Message-ID: <bug-76483-8800-oaWJSj6953@http.bugs.freedesktop.org/>
References: <bug-76483-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2008974118=="
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


--===============2008974118==
Content-Type: multipart/alternative; boundary="1404089605.FFFE4.25621"; charset="us-ascii"


--1404089605.FFFE4.25621
Date: Mon, 30 Jun 2014 00:53:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76483

--- Comment #19 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #17)
> With the extra output the display on -> standby (off) transition now looks
> like:
> 
> [  227.434722] nouveau D[     I2C][0000:05:00.0] AUXCH(3): 8: 0x00000600 1
> [  227.434736] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000002
> [  227.434738] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
> [  227.434741] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
> [  227.434743] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
> [  227.434877] nouveau D[     I2C][0000:05:00.0] AUXCH(3): 00 0x01108000
> 0x10000000
> [  227.434884] nouveau  [   PDISP][0000:05:00.0] nv50_sor_mthd: 0000 0184
> [  227.434886] nouveau  [   PDISP][0000:05:00.0]        0200 0102
> [  227.434888] nouveau  [   PDISP][0000:05:00.0]        0002 01c1
> [  227.434891] nouveau  [   PDISP][0000:05:00.0]        0006 0284
> [  227.434893] nouveau  [   PDISP][0000:05:00.0]        0002 0284
> [  227.434913] nouveau  [   PDISP][0000:05:00.0] nv50_sor_mthd: 0006 0184
> [  227.434915] nouveau  [   PDISP][0000:05:00.0]        0200 0102
> [  227.434917] nouveau  [   PDISP][0000:05:00.0]        0002 01c1
> [  227.434919] nouveau  [   PDISP][0000:05:00.0]        0006 0284
> [  227.434921] nouveau  [   PDISP][0000:05:00.0]        0002 0284
> 
> and the (unsuccessful) off -> on transition looks like:
> 
> [  277.955374] nouveau D[     I2C][0000:05:00.0] AUXCH(3): 8: 0x00000600 1
> [  277.955387] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000001
> [  277.955389] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
> [  277.955392] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
> [  277.955394] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
> [  277.955528] nouveau D[     I2C][0000:05:00.0] AUXCH(3): 00 0x01108000
> 0x10000000
> [  277.957570] nouveau  [   PDISP][0000:05:00.0] nv50_sor_mthd: 0000 0184
> [  277.957574] nouveau  [   PDISP][0000:05:00.0]        0200 0102
> [  277.957576] nouveau  [   PDISP][0000:05:00.0]        0002 01c1
> [  277.957578] nouveau  [   PDISP][0000:05:00.0]        0006 0284
> [  277.957580] nouveau  [   PDISP][0000:05:00.0]        0002 0284
> [  277.957600] nouveau  [   PDISP][0000:05:00.0] nv50_sor_mthd: 0006 0184
> [  277.957602] nouveau  [   PDISP][0000:05:00.0]        0200 0102
> [  277.957604] nouveau  [   PDISP][0000:05:00.0]        0002 01c1
> [  277.957607] nouveau  [   PDISP][0000:05:00.0]        0006 0284
> [  277.957609] nouveau  [   PDISP][0000:05:00.0]        0002 0284
> 
> I'll attach the full log soon (pressed for time ATM).

I see what's going on, I'll push a patch in the next little while.  Thank you.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1404089605.FFFE4.25621
Date: Mon, 30 Jun 2014 00:53:25 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76483#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50, bisected, RFC patch] xset dpms force {on,off} does not work over DP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76483">bug 76483</a>
              from <span class="vcard"><a class="email" href="mailto:skeggsb&#64;gmail.com" title="Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> <span class="fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=76483#c17">comment #17</a>)
<span class="quote">&gt; With the extra output the display on -&gt; standby (off) transition now looks
&gt; like:
&gt; 
&gt; [  227.434722] nouveau D[     I2C][0000:05:00.0] AUXCH(3): 8: 0x00000600 1
&gt; [  227.434736] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000002
&gt; [  227.434738] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
&gt; [  227.434741] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
&gt; [  227.434743] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
&gt; [  227.434877] nouveau D[     I2C][0000:05:00.0] AUXCH(3): 00 0x01108000
&gt; 0x10000000
&gt; [  227.434884] nouveau  [   PDISP][0000:05:00.0] nv50_sor_mthd: 0000 0184
&gt; [  227.434886] nouveau  [   PDISP][0000:05:00.0]        0200 0102
&gt; [  227.434888] nouveau  [   PDISP][0000:05:00.0]        0002 01c1
&gt; [  227.434891] nouveau  [   PDISP][0000:05:00.0]        0006 0284
&gt; [  227.434893] nouveau  [   PDISP][0000:05:00.0]        0002 0284
&gt; [  227.434913] nouveau  [   PDISP][0000:05:00.0] nv50_sor_mthd: 0006 0184
&gt; [  227.434915] nouveau  [   PDISP][0000:05:00.0]        0200 0102
&gt; [  227.434917] nouveau  [   PDISP][0000:05:00.0]        0002 01c1
&gt; [  227.434919] nouveau  [   PDISP][0000:05:00.0]        0006 0284
&gt; [  227.434921] nouveau  [   PDISP][0000:05:00.0]        0002 0284
&gt; 
&gt; and the (unsuccessful) off -&gt; on transition looks like:
&gt; 
&gt; [  277.955374] nouveau D[     I2C][0000:05:00.0] AUXCH(3): 8: 0x00000600 1
&gt; [  277.955387] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000001
&gt; [  277.955389] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
&gt; [  277.955392] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
&gt; [  277.955394] nouveau D[     I2C][0000:05:00.0] AUXCH(3): wr 0x00000000
&gt; [  277.955528] nouveau D[     I2C][0000:05:00.0] AUXCH(3): 00 0x01108000
&gt; 0x10000000
&gt; [  277.957570] nouveau  [   PDISP][0000:05:00.0] nv50_sor_mthd: 0000 0184
&gt; [  277.957574] nouveau  [   PDISP][0000:05:00.0]        0200 0102
&gt; [  277.957576] nouveau  [   PDISP][0000:05:00.0]        0002 01c1
&gt; [  277.957578] nouveau  [   PDISP][0000:05:00.0]        0006 0284
&gt; [  277.957580] nouveau  [   PDISP][0000:05:00.0]        0002 0284
&gt; [  277.957600] nouveau  [   PDISP][0000:05:00.0] nv50_sor_mthd: 0006 0184
&gt; [  277.957602] nouveau  [   PDISP][0000:05:00.0]        0200 0102
&gt; [  277.957604] nouveau  [   PDISP][0000:05:00.0]        0002 01c1
&gt; [  277.957607] nouveau  [   PDISP][0000:05:00.0]        0006 0284
&gt; [  277.957609] nouveau  [   PDISP][0000:05:00.0]        0002 0284
&gt; 
&gt; I'll attach the full log soon (pressed for time ATM).</span >

I see what's going on, I'll push a patch in the next little while.  Thank you.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1404089605.FFFE4.25621--

--===============2008974118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2008974118==--
