From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75776] [NV50 gallium] Hearthstone displays corrupted
	buffers
Date: Mon, 10 Mar 2014 07:48:07 +0000
Message-ID: <bug-75776-8800-LUYznIer79@http.bugs.freedesktop.org/>
References: <bug-75776-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1634809056=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75776-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1634809056==
Content-Type: multipart/alternative; boundary="1394437687.7D520.25749"; charset="us-ascii"


--1394437687.7D520.25749
Date: Mon, 10 Mar 2014 07:48:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75776

--- Comment #10 from Lubosz Sarnecki <lubosz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Should I try Linux from git, in case it was fixed in nouveau?
I am on Linux 3.13.6 (Arch).

Also I noticed some Uniforms in the dump, which were near negative zero, e.g.
-0.00001337. I don't know if this could be an issue.

Is there a way to bisect the dump or remove certain calls?
Is there a way to convert the dump to a C program?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394437687.7D520.25749
Date: Mon, 10 Mar 2014 07:48:07 +0000
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
   title="NEW --- - [NV50 gallium] Hearthstone displays corrupted buffers"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75776#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50 gallium] Hearthstone displays corrupted buffers"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75776">bug 75776</a>
              from <span class="vcard"><a class="email" href="mailto:lubosz&#64;gmail.com" title="Lubosz Sarnecki &lt;lubosz&#64;gmail.com&gt;"> <span class="fn">Lubosz Sarnecki</span></a>
</span></b>
        <pre>Should I try Linux from git, in case it was fixed in nouveau?
I am on Linux 3.13.6 (Arch).

Also I noticed some Uniforms in the dump, which were near negative zero, e.g.
-0.00001337. I don't know if this could be an issue.

Is there a way to bisect the dump or remove certain calls?
Is there a way to convert the dump to a C program?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394437687.7D520.25749--

--===============1634809056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1634809056==--
