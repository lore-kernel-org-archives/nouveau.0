From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72717] [NVE6] No sound via display port (hdmi works)
Date: Sat, 14 Dec 2013 22:15:50 +0000
Message-ID: <bug-72717-8800-jalcUeFkgO@http.bugs.freedesktop.org/>
References: <bug-72717-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0015210969=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72717-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0015210969==
Content-Type: multipart/alternative; boundary="1387059349.604FF7Db2.2632"; charset="us-ascii"


--1387059349.604FF7Db2.2632
Date: Sat, 14 Dec 2013 22:15:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72717

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|No sound via display port   |[NVE6] No sound via display
                   |(hdmi works)                |port (hdmi works)

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Probably missing some initialization. Can you boot with 'nouveau.debug=debug'
(which turns on all nv_debug messages) -- there's some stuff in DP init that
might make sense to someone. [Unfortunately I know very little about DP.]

If you'd like to push this further yourself, you could make an mmiotrace of the
blob of a unplug/plug sequence, that might give someone some hints. See
https://wiki.ubuntu.com/X/MMIOTracing for some hints as to how to start.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387059349.604FF7Db2.2632
Date: Sat, 14 Dec 2013 22:15:49 +0000
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
   title="NEW --- - [NVE6] No sound via display port (hdmi works)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72717">bug 72717</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>No sound via display port (hdmi works)
           </td>
           <td>[NVE6] No sound via display port (hdmi works)
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] No sound via display port (hdmi works)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72717#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] No sound via display port (hdmi works)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72717">bug 72717</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Probably missing some initialization. Can you boot with 'nouveau.debug=debug'
(which turns on all nv_debug messages) -- there's some stuff in DP init that
might make sense to someone. [Unfortunately I know very little about DP.]

If you'd like to push this further yourself, you could make an mmiotrace of the
blob of a unplug/plug sequence, that might give someone some hints. See
<a href="https://wiki.ubuntu.com/X/MMIOTracing">https://wiki.ubuntu.com/X/MMIOTracing</a> for some hints as to how to start.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387059349.604FF7Db2.2632--

--===============0015210969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0015210969==--
