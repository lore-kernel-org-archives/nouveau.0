From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62305] [NV4B] No HDMI Audio out (pass-thru) on
	Geforce 7600 Go
Date: Mon, 19 Aug 2013 14:39:23 +0000
Message-ID: <bug-62305-8800-g2ncnnC9WE@http.bugs.freedesktop.org/>
References: <bug-62305-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0014824418=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-62305-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0014824418==
Content-Type: multipart/alternative; boundary="1376923163.a808Abf2.23846"; charset="us-ascii"


--1376923163.a808Abf2.23846
Date: Mon, 19 Aug 2013 14:39:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62305

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|No HDMI Audio out           |[NV4B] No HDMI Audio out
                   |(pass-thru) on Geforce 7600 |(pass-thru) on Geforce 7600
                   |Go                          |Go

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
There is only HDMI audio support starting with NV84. If you're interested in
helping to get this to work, please collect a mmiotrace of the nvidia
proprietary driver that captures a plug and unplug HDMI event. (i.e. start it
without hdmi, then plug hdmi in, then unplug it.) Please be sure to add trace
markers (echo stuff > /sys/kernel/debug/tracing/trace_marker) before/after you
perform each of those things. I guess it wouldn't hurt to also try playing
something over HDMI, but I doubt that anything actually happens when you do
that. [Please make sure it's an audio-only thing, as video would rather
complicate the trace.]

There are some instructions on how to do an mmiotrace at
https://wiki.ubuntu.com/X/MMIOTracing

The resulting trace file should be 50-100MB, so please compress it before
uploading. (And if it's just a few KB, you did something wrong.)

Also upload a copy of your vbios (/sys/kernel/debug/dri/0/vbios.rom if you're
running nouveau).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376923163.a808Abf2.23846
Date: Mon, 19 Aug 2013 14:39:23 +0000
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
   title="NEW --- - [NV4B] No HDMI Audio out (pass-thru) on Geforce 7600 Go"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62305">bug 62305</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>No HDMI Audio out (pass-thru) on Geforce 7600 Go
           </td>
           <td>[NV4B] No HDMI Audio out (pass-thru) on Geforce 7600 Go
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4B] No HDMI Audio out (pass-thru) on Geforce 7600 Go"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62305#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4B] No HDMI Audio out (pass-thru) on Geforce 7600 Go"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62305">bug 62305</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>There is only HDMI audio support starting with NV84. If you're interested in
helping to get this to work, please collect a mmiotrace of the nvidia
proprietary driver that captures a plug and unplug HDMI event. (i.e. start it
without hdmi, then plug hdmi in, then unplug it.) Please be sure to add trace
markers (echo stuff &gt; /sys/kernel/debug/tracing/trace_marker) before/after you
perform each of those things. I guess it wouldn't hurt to also try playing
something over HDMI, but I doubt that anything actually happens when you do
that. [Please make sure it's an audio-only thing, as video would rather
complicate the trace.]

There are some instructions on how to do an mmiotrace at
<a href="https://wiki.ubuntu.com/X/MMIOTracing">https://wiki.ubuntu.com/X/MMIOTracing</a>

The resulting trace file should be 50-100MB, so please compress it before
uploading. (And if it's just a few KB, you did something wrong.)

Also upload a copy of your vbios (/sys/kernel/debug/dri/0/vbios.rom if you're
running nouveau).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376923163.a808Abf2.23846--

--===============0014824418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0014824418==--
