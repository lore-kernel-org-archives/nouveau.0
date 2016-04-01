From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94725] Nouveau driver fails to poweron GPU on GM204
 after dynamic poweroff
Date: Fri, 01 Apr 2016 15:17:34 +0000
Message-ID: <bug-94725-8800-0111GoOQVN@http.bugs.freedesktop.org/>
References: <bug-94725-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1760706419=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94725-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1760706419==
Content-Type: multipart/alternative; boundary="14595238540.3FbbabDC.27063";
 charset="UTF-8"


--14595238540.3FbbabDC.27063
Date: Fri, 1 Apr 2016 15:17:34 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94725

--- Comment #13 from Karol Herbst <freedesktop-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org> ---
(In reply to Rashed Abdel-Tawab from comment #10)
> Created attachment 122654 [details]
> dmesg using tentative fix
> 
> Alexandre, using the tentative fix you uploaded it switches GPUs properly
> now. Here is the dmesg from that since there are still some errors related
> to power state in it. Also, for some reason lshw is returning this for the
> nVidia GPU now:
> 
> *-generic
>                 description: Unassigned class
>                 product: Illegal Vendor ID
>                 vendor: Illegal Vendor ID
>                 physical id: 0
>                 bus info: pci@0000:01:00.0
>                 version: ff
>                 width: 32 bits
>                 clock: 66MHz
>                 capabilities: bus_master vga_palette cap_list rom
>                 configuration: driver=nouveau latency=255 maxlatency=255
> mingnt=255
>                 resources: irq:129 memory:dc000000-dcffffff
> memory:b0000000-bfffffff memory:c0000000-c1ffffff ioport:e000(size=128)
> memory:dd000000-dd07ffff
> 
> I don't know if that's related to this at all but before, if I set runpm=0
> and run lshw, it would return the proper description (running it without
> runpm would cause the system to hang)

I have the same issue with bbswitch (and maybe vgaswitcheroo too). Basically
this means that in d3cold we can't talke to the gpu and the information isn't
cached or something like that.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14595238540.3FbbabDC.27063
Date: Fri, 1 Apr 2016 15:17:34 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver fails to poweron GPU on GM204 after dynamic poweroff"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94725#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver fails to poweron GPU on GM204 after dynamic poweroff"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94725">bug 94725</a>
              from <span class="vcard"><a class="email" href="mailto:freedesktop&#64;karolherbst.de" title="Karol Herbst &lt;freedesktop&#64;karolherbst.de&gt;"> <span class="fn">Karol Herbst</span></a>
</span></b>
        <pre>(In reply to Rashed Abdel-Tawab from <a href="show_bug.cgi?id=94725#c10">comment #10</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=122654" name="attach_122654" title="dmesg using tentative fix">attachment 122654</a> <a href="attachment.cgi?id=122654&amp;action=edit" title="dmesg using tentative fix">[details]</a></span>
&gt; dmesg using tentative fix
&gt; 
&gt; Alexandre, using the tentative fix you uploaded it switches GPUs properly
&gt; now. Here is the dmesg from that since there are still some errors related
&gt; to power state in it. Also, for some reason lshw is returning this for the
&gt; nVidia GPU now:
&gt; 
&gt; *-generic
&gt;                 description: Unassigned class
&gt;                 product: Illegal Vendor ID
&gt;                 vendor: Illegal Vendor ID
&gt;                 physical id: 0
&gt;                 bus info: pci&#64;0000:01:00.0
&gt;                 version: ff
&gt;                 width: 32 bits
&gt;                 clock: 66MHz
&gt;                 capabilities: bus_master vga_palette cap_list rom
&gt;                 configuration: driver=nouveau latency=255 maxlatency=255
&gt; mingnt=255
&gt;                 resources: irq:129 memory:dc000000-dcffffff
&gt; memory:b0000000-bfffffff memory:c0000000-c1ffffff ioport:e000(size=128)
&gt; memory:dd000000-dd07ffff
&gt; 
&gt; I don't know if that's related to this at all but before, if I set runpm=0
&gt; and run lshw, it would return the proper description (running it without
&gt; runpm would cause the system to hang)</span >

I have the same issue with bbswitch (and maybe vgaswitcheroo too). Basically
this means that in d3cold we can't talke to the gpu and the information isn't
cached or something like that.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14595238540.3FbbabDC.27063--

--===============1760706419==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1760706419==--
