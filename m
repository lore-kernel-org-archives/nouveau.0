From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93563] New: Hack'n'Slash hangs with Nouveau driver
Date: Sat, 02 Jan 2016 18:42:40 +0000
Message-ID: <bug-93563-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1492065027=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1492065027==
Content-Type: multipart/alternative; boundary="1451760160.6aFA70.9985"; charset="UTF-8"


--1451760160.6aFA70.9985
Date: Sat, 2 Jan 2016 18:42:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93563

            Bug ID: 93563
           Summary: Hack'n'Slash hangs with Nouveau driver
           Product: Mesa
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: spzakulec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 120767
  --> https://bugs.freedesktop.org/attachment.cgi?id=120767&action=edit
Dmesg from boot that includes playing Hack'n'Slash

Hack'n'Slash- (http://store.steampowered.com/app/246070/?snr=1_7_15__13)
freezes up & hangs very early in the game (once you get to the main map).  This
only happens with the Nouveau driver- if you install the proprietary NVidia
driver (version doesn't seem to matter), the game works just fine.

Here's my system information:
HP Compaq 8510w laptop
Kubuntu 14.04
OpenGL renderer string: Gallium 0.4 on NV84
OpenGL version string: 3.0 Mesa 11.2.0-devel (git-b835255 2016-01-01
trusty-oibaf-ppa
Kernel: 3.13.0-49-generic
CPU: model name : Intel(R) Core(TM)2 Duo CPU     T7300  @ 2.00GHz
Graphics card:
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation G84GLM [Quadro FX
570M] [10de:040c] (rev a1)

How to reproduce this:
Start a new game.
Finish the first room, and then go through the second room where you name your
sprite.
Once you try to leave that room, you'll be taken to the world map.

If you have an existing save game, you need to rewind to BobCave (where Bob is
the name of your sprite).

What happens:
The screen loads very slowly, the transition goes on for a very long time, and
almost every keyboard & mouse press is swallowed up- if you're patient, you can
eventually get the game menu to show up by pressing Esc enough times, and then
going down to exit game.  You can also just Alt-Tab out and kill the game.
You can't really continue playing because of these issues.

What should happen:
You leave the cave, and you get a quick transition to the world map (maybe 2-3
seconds), and then you can move freely around the screen without any lag or
screen corruption.
I've attached my dmesg log which does have some Nouveau error messages from
when I was playing.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1451760160.6aFA70.9985
Date: Sat, 2 Jan 2016 18:42:40 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Hack'n'Slash hangs with Nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93563">93563</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Hack'n'Slash hangs with Nouveau driver
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>spzakulec&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=120767" name="attach_120767" title="Dmesg from boot that includes playing Hack'n'Slash">attachment 120767</a> <a href="attachment.cgi?id=120767&amp;action=edit" title="Dmesg from boot that includes playing Hack'n'Slash">[details]</a></span>
Dmesg from boot that includes playing Hack'n'Slash

Hack'n'Slash- (<a href="http://store.steampowered.com/app/246070/?snr=1_7_15__13">http://store.steampowered.com/app/246070/?snr=1_7_15__13</a>)
freezes up &amp; hangs very early in the game (once you get to the main map).  This
only happens with the Nouveau driver- if you install the proprietary NVidia
driver (version doesn't seem to matter), the game works just fine.

Here's my system information:
HP Compaq 8510w laptop
Kubuntu 14.04
OpenGL renderer string: Gallium 0.4 on NV84
OpenGL version string: 3.0 Mesa 11.2.0-devel (git-b835255 2016-01-01
trusty-oibaf-ppa
Kernel: 3.13.0-49-generic
CPU: model name : Intel(R) Core(TM)2 Duo CPU     T7300  &#64; 2.00GHz
Graphics card:
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation G84GLM [Quadro FX
570M] [10de:040c] (rev a1)

How to reproduce this:
Start a new game.
Finish the first room, and then go through the second room where you name your
sprite.
Once you try to leave that room, you'll be taken to the world map.

If you have an existing save game, you need to rewind to BobCave (where Bob is
the name of your sprite).

What happens:
The screen loads very slowly, the transition goes on for a very long time, and
almost every keyboard &amp; mouse press is swallowed up- if you're patient, you can
eventually get the game menu to show up by pressing Esc enough times, and then
going down to exit game.  You can also just Alt-Tab out and kill the game.
You can't really continue playing because of these issues.

What should happen:
You leave the cave, and you get a quick transition to the world map (maybe 2-3
seconds), and then you can move freely around the screen without any lag or
screen corruption.
I've attached my dmesg log which does have some Nouveau error messages from
when I was playing.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1451760160.6aFA70.9985--

--===============1492065027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1492065027==--
