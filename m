From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47965] I can't modify brightness with nVidia 1000m
	Quadro
Date: Mon, 12 Nov 2012 08:13:04 +0000
Message-ID: <bug-47965-8800-vP72sm3wnO@http.bugs.freedesktop.org/>
References: <bug-47965-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1919525635=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-47965-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1919525635==
Content-Type: multipart/alternative; boundary="1352707984.C20c582a2.24763"; charset="us-ascii"


--1352707984.C20c582a2.24763
Date: Mon, 12 Nov 2012 08:13:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=47965

Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           See Also|                            |https://bugs.freedesktop.or
                   |                            |g/show_bug.cgi?id=39550

--- Comment #7 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Try using "acpi_backlight=vendor" (as a parameter to your kernel command line).
It will force the nouveau backlight to be used rather than the ACPI one

Note that there is a similar issue with HP Elitebook 8530w (see bug 39550)
Quick search indicates that HP laptops are quite common with those type of
issues

Apart from that can you attach your vbios [1]


[1] http://nouveau.freedesktop.org/wiki/DumpingVideoBios

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1352707984.C20c582a2.24763
Date: Mon, 12 Nov 2012 08:13:04 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - I can't modify brightness with nVidia 1000m Quadro"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=47965">bug 47965</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">See Also</td>
           <td>
               &nbsp;
           </td>
           <td>https://bugs.freedesktop.org/show_bug.cgi?id=39550
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - I can't modify brightness with nVidia 1000m Quadro"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=47965#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - I can't modify brightness with nVidia 1000m Quadro"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=47965">bug 47965</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Try using &quot;acpi_backlight=vendor&quot; (as a parameter to your kernel command line).
It will force the nouveau backlight to be used rather than the ACPI one

Note that there is a similar issue with HP Elitebook 8530w (see <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Brightness stuck to low value after suspend/resume"
   href="show_bug.cgi?id=39550">bug 39550</a>)
Quick search indicates that HP laptops are quite common with those type of
issues

Apart from that can you attach your vbios [1]


[1] <a href="http://nouveau.freedesktop.org/wiki/DumpingVideoBios">http://nouveau.freedesktop.org/wiki/DumpingVideoBios</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1352707984.C20c582a2.24763--

--===============1919525635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1919525635==--
