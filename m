From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82834] [NV92] GeForce 8800 GS shows incorrect
 temperature with nouveau
Date: Wed, 20 Aug 2014 18:58:54 +0000
Message-ID: <bug-82834-8800-NwXj88ZtOH@http.bugs.freedesktop.org/>
References: <bug-82834-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2012843757=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82834-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2012843757==
Content-Type: multipart/alternative; boundary="1408561134.cBB52.15973"; charset="us-ascii"


--1408561134.cBB52.15973
Date: Wed, 20 Aug 2014 18:58:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82834

--- Comment #5 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
(In reply to comment #4)
> Created attachment 104991 [details]
> dmesg from nouveau/linux-3.17 + increased  udelay
> 
> Changes:
> 
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/ic.c
> b/drivers/gpu/drm/nouveau/core/subdev/therm/ic.c
> index ca9ad9f..8afd3ba 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/therm/ic.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/therm/ic.c
> @@ -60,9 +60,9 @@ static struct nouveau_i2c_board_info
>  nv_board_infos[] = {
>         { { I2C_BOARD_INFO("w83l785ts", 0x2d) }, 0 },
>         { { I2C_BOARD_INFO("w83781d", 0x2d) }, 0  },
> -       { { I2C_BOARD_INFO("adt7473", 0x2e) }, 40  },
> -       { { I2C_BOARD_INFO("adt7473", 0x2d) }, 40  },
> -       { { I2C_BOARD_INFO("adt7473", 0x2c) }, 40  },
> +       { { I2C_BOARD_INFO("adt7473", 0x2e) }, 100  },
> +       { { I2C_BOARD_INFO("adt7473", 0x2d) }, 100  },
> +       { { I2C_BOARD_INFO("adt7473", 0x2c) }, 100  },
>         { { I2C_BOARD_INFO("f75375", 0x2e) }, 0  },
>         { { I2C_BOARD_INFO("lm99", 0x4c) }, 0  },
>         { { I2C_BOARD_INFO("lm90", 0x4c) }, 0  },
> 
> on top of 4898ac046d24894d7b2a5a96a1cff4e095844323 ("drm/nouveau/platform:
> fix compilation error")

Looks good.

> 
> It doesn't help - same 0.0 C

It is not supposed to fix the internal temperature sensor, it supposed to
create another temperature sensor. Can I see the kernel logs with this patch
applied ? Make sure your initramfs doesn't contain another version of
nouveau.ko

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408561134.cBB52.15973
Date: Wed, 20 Aug 2014 18:58:54 +0000
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
   title="NEW --- - [NV92] GeForce 8800 GS shows incorrect temperature with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82834#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV92] GeForce 8800 GS shows incorrect temperature with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82834">bug 82834</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=82834#c4">comment #4</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=104991" name="attach_104991" title="dmesg from nouveau/linux-3.17 + increased  udelay">attachment 104991</a> <a href="attachment.cgi?id=104991&amp;action=edit" title="dmesg from nouveau/linux-3.17 + increased  udelay">[details]</a></span>
&gt; dmesg from nouveau/linux-3.17 + increased  udelay
&gt; 
&gt; Changes:
&gt; 
&gt; diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/ic.c
&gt; b/drivers/gpu/drm/nouveau/core/subdev/therm/ic.c
&gt; index ca9ad9f..8afd3ba 100644
&gt; --- a/drivers/gpu/drm/nouveau/core/subdev/therm/ic.c
&gt; +++ b/drivers/gpu/drm/nouveau/core/subdev/therm/ic.c
&gt; &#64;&#64; -60,9 +60,9 &#64;&#64; static struct nouveau_i2c_board_info
&gt;  nv_board_infos[] = {
&gt;         { { I2C_BOARD_INFO(&quot;w83l785ts&quot;, 0x2d) }, 0 },
&gt;         { { I2C_BOARD_INFO(&quot;w83781d&quot;, 0x2d) }, 0  },
&gt; -       { { I2C_BOARD_INFO(&quot;adt7473&quot;, 0x2e) }, 40  },
&gt; -       { { I2C_BOARD_INFO(&quot;adt7473&quot;, 0x2d) }, 40  },
&gt; -       { { I2C_BOARD_INFO(&quot;adt7473&quot;, 0x2c) }, 40  },
&gt; +       { { I2C_BOARD_INFO(&quot;adt7473&quot;, 0x2e) }, 100  },
&gt; +       { { I2C_BOARD_INFO(&quot;adt7473&quot;, 0x2d) }, 100  },
&gt; +       { { I2C_BOARD_INFO(&quot;adt7473&quot;, 0x2c) }, 100  },
&gt;         { { I2C_BOARD_INFO(&quot;f75375&quot;, 0x2e) }, 0  },
&gt;         { { I2C_BOARD_INFO(&quot;lm99&quot;, 0x4c) }, 0  },
&gt;         { { I2C_BOARD_INFO(&quot;lm90&quot;, 0x4c) }, 0  },
&gt; 
&gt; on top of 4898ac046d24894d7b2a5a96a1cff4e095844323 (&quot;drm/nouveau/platform:
&gt; fix compilation error&quot;)</span >

Looks good.

<span class="quote">&gt; 
&gt; It doesn't help - same 0.0 C</span >

It is not supposed to fix the internal temperature sensor, it supposed to
create another temperature sensor. Can I see the kernel logs with this patch
applied ? Make sure your initramfs doesn't contain another version of
nouveau.ko</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408561134.cBB52.15973--

--===============2012843757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2012843757==--
