From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80300] [NVE7] Fails to suspend on 3.15
Date: Fri, 20 Jun 2014 23:50:06 +0000
Message-ID: <bug-80300-8800-mpUTtRtv5m@http.bugs.freedesktop.org/>
References: <bug-80300-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0043986900=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80300-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0043986900==
Content-Type: multipart/alternative; boundary="1403308205.7F7bdc1.4323"; charset="us-ascii"


--1403308205.7F7bdc1.4323
Date: Fri, 20 Jun 2014 23:50:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80300

--- Comment #4 from e.swanson+xorgbugs-5lA2vZBjcqn3oGB3hsPCZA@public.gmane.org ---
Alright, after a long troubleshooting session assisted by imirkin on #nouveau,
I tested the following configurations:

v3.15 from Linus's github tree: suspends fine, but has the "3.14" error on
resume
linux-3.15.y from linux-stable tree: suspends fine, but has the "3.14" error on
resume
drm-fixes from airlied's tree: fails to boot (hangs after loading initrd and
decrypting my drive, but before running anything on /. It may not be mounting
root. I'm using btrfs, and I don't know what the mount line in console looks
like for that fs.)
drm-next from airlied's tree: works! no errors on suspend or resume.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403308205.7F7bdc1.4323
Date: Fri, 20 Jun 2014 23:50:05 +0000
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
   title="NEW --- - [NVE7] Fails to suspend on 3.15"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80300#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] Fails to suspend on 3.15"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80300">bug 80300</a>
              from <span class="vcard"><a class="email" href="mailto:e.swanson+xorgbugs&#64;alloscomp.com" title="e.swanson+xorgbugs&#64;alloscomp.com">e.swanson+xorgbugs&#64;alloscomp.com</a>
</span></b>
        <pre>Alright, after a long troubleshooting session assisted by imirkin on #nouveau,
I tested the following configurations:

v3.15 from Linus's github tree: suspends fine, but has the &quot;3.14&quot; error on
resume
linux-3.15.y from linux-stable tree: suspends fine, but has the &quot;3.14&quot; error on
resume
drm-fixes from airlied's tree: fails to boot (hangs after loading initrd and
decrypting my drive, but before running anything on /. It may not be mounting
root. I'm using btrfs, and I don't know what the mount line in console looks
like for that fs.)
drm-next from airlied's tree: works! no errors on suspend or resume.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403308205.7F7bdc1.4323--

--===============0043986900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0043986900==--
