From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85086] [NVE7] read/write faults leave machine
	unsuable
Date: Thu, 16 Oct 2014 16:09:39 +0000
Message-ID: <bug-85086-8800-dTfclcbWN9@http.bugs.freedesktop.org/>
References: <bug-85086-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1660999616=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-85086-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1660999616==
Content-Type: multipart/alternative; boundary="1413475778.ffDF02.14275"; charset="UTF-8"


--1413475778.ffDF02.14275
Date: Thu, 16 Oct 2014 16:09:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85086

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|read/write faults leave     |[NVE7] read/write faults
                   |machine unsuable            |leave machine unsuable

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
In an effort to reduce irrelevant information, you've cut out potentially
relevant things. Best to attach unredacted logs...

(a) Is this an optimus setup? If so, can you try booting with nouveau.runpm=0
[this will cause the nvidia card not to auto-suspend when not used]
(b) Please attach a full kernel log, from boot until the errors.

It would appear that the errors are brought on by a channel hang, from which
nouveau recovers in a... less-than-graceful fashion. This is, generally, a
known "issue" (more like 100 inter-related issues). However perhaps you can
update your userspace (specifically mesa), and whatever issue causes the hang
has been fixed in 10.3.1. Upgrading the ddx to 1.0.11 wouldn't hurt either.

As Tobias suggested, if you can identify an action that causes the issue, that
would be extremely helpful.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1413475778.ffDF02.14275
Date: Thu, 16 Oct 2014 16:09:38 +0000
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
   title="NEW - [NVE7] read/write faults leave machine unsuable"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85086">bug 85086</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>read/write faults leave machine unsuable
           </td>
           <td>[NVE7] read/write faults leave machine unsuable
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] read/write faults leave machine unsuable"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85086#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] read/write faults leave machine unsuable"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85086">bug 85086</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>In an effort to reduce irrelevant information, you've cut out potentially
relevant things. Best to attach unredacted logs...

(a) Is this an optimus setup? If so, can you try booting with nouveau.runpm=0
[this will cause the nvidia card not to auto-suspend when not used]
(b) Please attach a full kernel log, from boot until the errors.

It would appear that the errors are brought on by a channel hang, from which
nouveau recovers in a... less-than-graceful fashion. This is, generally, a
known &quot;issue&quot; (more like 100 inter-related issues). However perhaps you can
update your userspace (specifically mesa), and whatever issue causes the hang
has been fixed in 10.3.1. Upgrading the ddx to 1.0.11 wouldn't hurt either.

As Tobias suggested, if you can identify an action that causes the issue, that
would be extremely helpful.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1413475778.ffDF02.14275--

--===============1660999616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1660999616==--
