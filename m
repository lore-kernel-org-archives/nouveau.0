From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64774] nouveau GF108 kernel crash in optimus mode
 when enabling external display output
Date: Mon, 06 Jan 2014 16:17:35 +0000
Message-ID: <bug-64774-8800-bgDHvLL0go@http.bugs.freedesktop.org/>
References: <bug-64774-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0947248320=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64774-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0947248320==
Content-Type: multipart/alternative; boundary="1389025055.A3e6c322.23836"; charset="us-ascii"


--1389025055.A3e6c322.23836
Date: Mon, 6 Jan 2014 16:17:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64774

--- Comment #27 from Pawel Sikora <pluto-PIIpFW8S9c0@public.gmane.org> ---
(In reply to comment #26)
> FWIW, my patch, which was deemed inappropriate for inclusion:
> http://marc.info/?l=dri-devel&m=137713025702333&w=2
> 
> Later in the thread, another patch was proposed:
> http://marc.info/?l=dri-devel&m=137715564208095&w=2
> 
> However I don't think it has made it upstream yet as Ben had some concerns.

the latest patch mentioned on lkml thread only changes hard system locks
into soft locks for kernel-3.12.6-300.fc20.x86_64. the suspend/resume cycles
works pretty stable for rawhide kernel-3.13.0-0.rc7.git0.2.fc21.x86_64.

afaics, the 3.13 kernel contains some acpi/pm fixes in the nouveau area.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389025055.A3e6c322.23836
Date: Mon, 6 Jan 2014 16:17:35 +0000
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
   title="NEW --- - nouveau GF108 kernel crash in optimus mode when enabling external display output"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64774#c27">Comment # 27</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau GF108 kernel crash in optimus mode when enabling external display output"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64774">bug 64774</a>
              from <span class="vcard"><a class="email" href="mailto:pluto&#64;agmk.net" title="Pawel Sikora &lt;pluto&#64;agmk.net&gt;"> <span class="fn">Pawel Sikora</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=64774#c26">comment #26</a>)
<span class="quote">&gt; FWIW, my patch, which was deemed inappropriate for inclusion:
&gt; <a href="http://marc.info/?l=dri-devel&amp;m=137713025702333&amp;w=2">http://marc.info/?l=dri-devel&amp;m=137713025702333&amp;w=2</a>
&gt; 
&gt; Later in the thread, another patch was proposed:
&gt; <a href="http://marc.info/?l=dri-devel&amp;m=137715564208095&amp;w=2">http://marc.info/?l=dri-devel&amp;m=137715564208095&amp;w=2</a>
&gt; 
&gt; However I don't think it has made it upstream yet as Ben had some concerns.</span >

the latest patch mentioned on lkml thread only changes hard system locks
into soft locks for kernel-3.12.6-300.fc20.x86_64. the suspend/resume cycles
works pretty stable for rawhide kernel-3.13.0-0.rc7.git0.2.fc21.x86_64.

afaics, the 3.13 kernel contains some acpi/pm fixes in the nouveau area.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389025055.A3e6c322.23836--

--===============0947248320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0947248320==--
