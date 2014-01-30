From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74164] [NV04] Native monitor resolution missing
Date: Thu, 30 Jan 2014 21:39:26 +0000
Message-ID: <bug-74164-8800-Z4hRdmT6jQ@http.bugs.freedesktop.org/>
References: <bug-74164-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1435839161=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74164-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1435839161==
Content-Type: multipart/alternative; boundary="1391117966.BaCA06A1.11452"; charset="us-ascii"


--1391117966.BaCA06A1.11452
Date: Thu, 30 Jan 2014 21:39:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74164

--- Comment #13 from Mauro Molinari <mauromol-IWqWACnzNjyonA0d6jMUrA@public.gmane.org> ---
I see... so, what can I do now to try to understand why that file is not filled
in by nouveau?

monitor-edid talks about some different ways to get the edid: VBE (through BIOS
interruption 10h), ACPI 2.0, Open Firmware, Kernel mode-setting (which is not
working in our case). Another tool, read-edid
(http://polypux.org/projects/read-edid/) seems to use the i2c interface, but
I've not tried to see if it works.

Looking at the monitor-edid output, it seems like it's using the VBE mode to
correctly get this information, but I have to do a "setsebool mmap_low_allowed
1" previously to make it actually work. Could this be somewhat related to the
fact that nouveau can't get the information?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391117966.BaCA06A1.11452
Date: Thu, 30 Jan 2014 21:39:26 +0000
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
   title="NEW --- - [NV04] Native monitor resolution missing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74164#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV04] Native monitor resolution missing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74164">bug 74164</a>
              from <span class="vcard"><a class="email" href="mailto:mauromol&#64;tiscali.it" title="Mauro Molinari &lt;mauromol&#64;tiscali.it&gt;"> <span class="fn">Mauro Molinari</span></a>
</span></b>
        <pre>I see... so, what can I do now to try to understand why that file is not filled
in by nouveau?

monitor-edid talks about some different ways to get the edid: VBE (through BIOS
interruption 10h), ACPI 2.0, Open Firmware, Kernel mode-setting (which is not
working in our case). Another tool, read-edid
(<a href="http://polypux.org/projects/read-edid/">http://polypux.org/projects/read-edid/</a>) seems to use the i2c interface, but
I've not tried to see if it works.

Looking at the monitor-edid output, it seems like it's using the VBE mode to
correctly get this information, but I have to do a &quot;setsebool mmap_low_allowed
1&quot; previously to make it actually work. Could this be somewhat related to the
fact that nouveau can't get the information?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391117966.BaCA06A1.11452--

--===============1435839161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1435839161==--
