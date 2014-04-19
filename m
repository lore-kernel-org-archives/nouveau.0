From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75776] [NV50 gallium] Hearthstone displays corrupted
	buffers
Date: Sat, 19 Apr 2014 17:30:44 +0000
Message-ID: <bug-75776-8800-7nkdj3TvRY@http.bugs.freedesktop.org/>
References: <bug-75776-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0088015249=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75776-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0088015249==
Content-Type: multipart/alternative; boundary="1397928643.60E0B0.4234"; charset="us-ascii"


--1397928643.60E0B0.4234
Date: Sat, 19 Apr 2014 17:30:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75776

--- Comment #14 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #13)
> I also face this issue, I have NV4x card

No, you don't. You face an entirely different and unrelated issue. You can open
a separate bug for it.

> [  175.238926] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
> nstatus: BAD_ARGUMENT
> [  175.238962] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
> Hearthstone.exe[734]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242

Hmmmm....

$ lookup -a 49 -d NV01_SUBCHAN -- -v obj-class NV40_3D 208 0x04040242
RT_FORMAT => { COLOR = 0x2 | ZETA = Z24S8 | TYPE = SWIZZLED | LOG2_WIDTH = 4 |
LOG2_HEIGHT = 4 }

COLOR = 0x2? That's odd. Might need to investigate how this can happen... might
just be something missing in rnndb.

> [  175.248385] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
> nstatus: BAD_ARGUMENT
> [  175.248420] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
> Hearthstone.exe[734]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243

$ lookup -a 49 -d NV01_SUBCHAN -- -v obj-class NV40_3D 208 0x04040243
RT_FORMAT => { COLOR = R5G6B5 | ZETA = Z24S8 | TYPE = SWIZZLED | LOG2_WIDTH = 4
| LOG2_HEIGHT = 4 }

Ah yes, I know this issue well. Mixing 16-bit color and 32-bit zeta
(depth/stencil) attachments to an FBO. Not supported by the hardware, and the
driver doesn't "fix" it up either.

In any case, totally unrelated to the issue on the nva5 originally reported.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397928643.60E0B0.4234
Date: Sat, 19 Apr 2014 17:30:43 +0000
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
   title="NEW --- - [NV50 gallium] Hearthstone displays corrupted buffers"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75776#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50 gallium] Hearthstone displays corrupted buffers"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75776">bug 75776</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=75776#c13">comment #13</a>)
<span class="quote">&gt; I also face this issue, I have NV4x card</span >

No, you don't. You face an entirely different and unrelated issue. You can open
a separate bug for it.

<span class="quote">&gt; [  175.238926] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
&gt; nstatus: BAD_ARGUMENT
&gt; [  175.238962] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
&gt; Hearthstone.exe[734]] subc 7 class 0x4097 mthd 0x0208 data 0x04040242</span >

Hmmmm....

$ lookup -a 49 -d NV01_SUBCHAN -- -v obj-class NV40_3D 208 0x04040242
RT_FORMAT =&gt; { COLOR = 0x2 | ZETA = Z24S8 | TYPE = SWIZZLED | LOG2_WIDTH = 4 |
LOG2_HEIGHT = 4 }

COLOR = 0x2? That's odd. Might need to investigate how this can happen... might
just be something missing in rnndb.

<span class="quote">&gt; [  175.248385] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
&gt; nstatus: BAD_ARGUMENT
&gt; [  175.248420] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
&gt; Hearthstone.exe[734]] subc 7 class 0x4097 mthd 0x0208 data 0x04040243</span >

$ lookup -a 49 -d NV01_SUBCHAN -- -v obj-class NV40_3D 208 0x04040243
RT_FORMAT =&gt; { COLOR = R5G6B5 | ZETA = Z24S8 | TYPE = SWIZZLED | LOG2_WIDTH = 4
| LOG2_HEIGHT = 4 }

Ah yes, I know this issue well. Mixing 16-bit color and 32-bit zeta
(depth/stencil) attachments to an FBO. Not supported by the hardware, and the
driver doesn't &quot;fix&quot; it up either.

In any case, totally unrelated to the issue on the nva5 originally reported.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397928643.60E0B0.4234--

--===============0088015249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0088015249==--
