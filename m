From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79820] [NVE6] Strange readout on fan1_input when
	pwm1_min < 33
Date: Mon, 09 Jun 2014 13:17:01 +0000
Message-ID: <bug-79820-8800-qsdbQQhXQq@http.bugs.freedesktop.org/>
References: <bug-79820-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0535340219=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79820-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0535340219==
Content-Type: multipart/alternative; boundary="1402319821.4F6Ea0fc1.508"; charset="us-ascii"


--1402319821.4F6Ea0fc1.508
Date: Mon, 9 Jun 2014 13:17:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79820

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Strange readout on          |[NVE6] Strange readout on
                   |fan1_input when pwm1_min <  |fan1_input when pwm1_min <
                   |33                          |33

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
With nouveau loaded, can you grab vbios from /sys/kernel/debug/dri/0/vbios.rom?
Or use -s prom with nvagetbios?

It's moderately likely that the reported fan rpm is just 2x what it should be
-- did the fan sound louder with nouveau than with the blob? See
http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=e3601d0869a18acc19e58f2d1216b810632d75f0
(which will be in 3.16-rc1).

Martin -- any idea about the weird RPMs reported for the lower values?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1402319821.4F6Ea0fc1.508
Date: Mon, 9 Jun 2014 13:17:01 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] Strange readout on fan1_input when pwm1_min &lt; 33"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79820">bug 79820</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Strange readout on fan1_input when pwm1_min &lt; 33
           </td>
           <td>[NVE6] Strange readout on fan1_input when pwm1_min &lt; 33
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] Strange readout on fan1_input when pwm1_min &lt; 33"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79820#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] Strange readout on fan1_input when pwm1_min &lt; 33"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79820">bug 79820</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>With nouveau loaded, can you grab vbios from /sys/kernel/debug/dri/0/vbios.rom?
Or use -s prom with nvagetbios?

It's moderately likely that the reported fan rpm is just 2x what it should be
-- did the fan sound louder with nouveau than with the blob? See
<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=e3601d0869a18acc19e58f2d1216b810632d75f0">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=e3601d0869a18acc19e58f2d1216b810632d75f0</a>
(which will be in 3.16-rc1).

Martin -- any idea about the weird RPMs reported for the lower values?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402319821.4F6Ea0fc1.508--

--===============0535340219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0535340219==--
