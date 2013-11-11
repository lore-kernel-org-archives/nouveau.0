From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71472] [NV108] GT-740M not detected (mmiotrace)
Date: Mon, 11 Nov 2013 21:12:37 +0000
Message-ID: <bug-71472-8800-KCpOgaFMiX@http.bugs.freedesktop.org/>
References: <bug-71472-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0588264951=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71472-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0588264951==
Content-Type: multipart/alternative; boundary="1384204357.Ada8f2.14032"; charset="us-ascii"


--1384204357.Ada8f2.14032
Date: Mon, 11 Nov 2013 21:12:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71472

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[NV108] GT-740M not         |[NV108] GT-740M not
                   |detected                    |detected (mmiotrace)

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
You used the nouveau/master kernel, right? What's in dmesg? Does it say that it
can't find the VBIOS perchance? If so, you may need to try the drm-next tree --
it has a fix that's not in nouveau/master (but should have almost all the
commits in nouveau/master by now).

Also note that the card is marked as a 3d controller. That means it probably
has no outputs (but not necessarily) and that it can really only be useful for
3d accel. That part is not in nouveau/master, if you want you can look at
http://cgit.freedesktop.org/~darktama/nouveau/ for some _very_ prelim support
-- this allows you to build an "out of tree" kernel module. You'll still need
to extract graph firmware from the blob mmiotraces, but I wouldn't really
expect 3d accel to actually work properly quite yet.

I'm not sure what you're trying to achieve by filing this bug. The GK208 is
essentially unsupported hardware ATM -- there's some very prelim support atm,
and it's being worked on. If you'd like to contribute, it's probably best to
join #nouveau on irc.freenode.net.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384204357.Ada8f2.14032
Date: Mon, 11 Nov 2013 21:12:37 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV108] GT-740M not detected (mmiotrace)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71472">bug 71472</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>[NV108] GT-740M not detected
           </td>
           <td>[NV108] GT-740M not detected (mmiotrace)
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV108] GT-740M not detected (mmiotrace)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71472#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV108] GT-740M not detected (mmiotrace)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71472">bug 71472</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>You used the nouveau/master kernel, right? What's in dmesg? Does it say that it
can't find the VBIOS perchance? If so, you may need to try the drm-next tree --
it has a fix that's not in nouveau/master (but should have almost all the
commits in nouveau/master by now).

Also note that the card is marked as a 3d controller. That means it probably
has no outputs (but not necessarily) and that it can really only be useful for
3d accel. That part is not in nouveau/master, if you want you can look at
<a href="http://cgit.freedesktop.org/~darktama/nouveau/">http://cgit.freedesktop.org/~darktama/nouveau/</a> for some _very_ prelim support
-- this allows you to build an &quot;out of tree&quot; kernel module. You'll still need
to extract graph firmware from the blob mmiotraces, but I wouldn't really
expect 3d accel to actually work properly quite yet.

I'm not sure what you're trying to achieve by filing this bug. The GK208 is
essentially unsupported hardware ATM -- there's some very prelim support atm,
and it's being worked on. If you'd like to contribute, it's probably best to
join #nouveau on irc.freenode.net.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384204357.Ada8f2.14032--

--===============0588264951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0588264951==--
