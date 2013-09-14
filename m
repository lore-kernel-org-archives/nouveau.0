From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69349] New: Random image corruptions (in Debian
 Wheezy with Linux 3.2)
Date: Sat, 14 Sep 2013 08:25:11 +0000
Message-ID: <bug-69349-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1462193084=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1462193084==
Content-Type: multipart/alternative; boundary="1379147111.a30Af51E2.21419"; charset="us-ascii"


--1379147111.a30Af51E2.21419
Date: Sat, 14 Sep 2013 08:25:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69349

          Priority: medium
            Bug ID: 69349
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Random image corruptions (in Debian Wheezy with Linux
                    3.2)
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: paulepanter-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 85813
  --> https://bugs.freedesktop.org/attachment.cgi?id=85813&action=edit
Screenshot taken with `import` after opening a new tab in Iceweasel 17.0.8

Using Debian Wheezy with

    linux-image-3.2.0-4-686-pae 3.2.46-1+deb7u1
    xserver-xorg-video-nouveau 1:1.0.1-5
    libglu1-mesa:i386 8.0.5-4+deb7u2
    libdrm2                                2.4.40-1~deb7u2
    libudev0                               175-7.2
    xserver-xorg-core [xorg-video-abi-12]  2:1.12.4-6

sometimes there is an image corruption where some areas are garbled with other
colors. See the attached screenshot taken with `import` from the ImageMagick
suite. (What is that type of corruption called?)

The obfuscation was done with the following command.

    $ convert 20130909-Debian_Wheezy-nouveau-corruption.png -draw "rectangle
231,165 1703,953" 20130909-Debian_Wheezy-nouveau-corruption--obfuscated.png

This issue happened five times and I do not know how to force it. Three of
these five times it happened after resuming from suspend to RAM. Additionally
after these corruption start, the system is going to freeze after some time.
There are no error messages in `/var/log/syslog`, `/var/log/messages`,
`/var/log/Xorg.0.log` and `~/.xsession-errors`.

Please tell me, what else you need for debugging.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1379147111.a30Af51E2.21419
Date: Sat, 14 Sep 2013 08:25:11 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Random image corruptions (in Debian Wheezy with Linux 3.2)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69349">69349</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Random image corruptions (in Debian Wheezy with Linux 3.2)
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>paulepanter&#64;users.sourceforge.net
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=85813" name="attach_85813" title="Screenshot taken with `import` after opening a new tab in Iceweasel 17.0.8">attachment 85813</a> <a href="attachment.cgi?id=85813&amp;action=edit" title="Screenshot taken with `import` after opening a new tab in Iceweasel 17.0.8">[details]</a></span>
Screenshot taken with `import` after opening a new tab in Iceweasel 17.0.8

Using Debian Wheezy with

    linux-image-3.2.0-4-686-pae 3.2.46-1+deb7u1
    xserver-xorg-video-nouveau 1:1.0.1-5
    libglu1-mesa:i386 8.0.5-4+deb7u2
    libdrm2                                2.4.40-1~deb7u2
    libudev0                               175-7.2
    xserver-xorg-core [xorg-video-abi-12]  2:1.12.4-6

sometimes there is an image corruption where some areas are garbled with other
colors. See the attached screenshot taken with `import` from the ImageMagick
suite. (What is that type of corruption called?)

The obfuscation was done with the following command.

    $ convert 20130909-Debian_Wheezy-nouveau-corruption.png -draw &quot;rectangle
231,165 1703,953&quot; 20130909-Debian_Wheezy-nouveau-corruption--obfuscated.png

This issue happened five times and I do not know how to force it. Three of
these five times it happened after resuming from suspend to RAM. Additionally
after these corruption start, the system is going to freeze after some time.
There are no error messages in `/var/log/syslog`, `/var/log/messages`,
`/var/log/Xorg.0.log` and `~/.xsession-errors`.

Please tell me, what else you need for debugging.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1379147111.a30Af51E2.21419--

--===============1462193084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1462193084==--
