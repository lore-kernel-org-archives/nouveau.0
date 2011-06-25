From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 38673] New: all object is black
Date: Sat, 25 Jun 2011 11:00:57 -0700 (PDT)
Message-ID: <bug-38673-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

https://bugs.freedesktop.org/show_bug.cgi?id=38673

           Summary: all object is black
           Product: Mesa
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: fanfantasy7-QFKgK+z4sOrR7s880joybQ@public.gmane.org


hello,
when i launch fgfs, all object is black, but it's work

i am on fedora, nvidia

[code]
[bertrand@bertrand-desktop ~]$ fgfs --fog-disable --timeofday=noon
--fg-scenery=/home/bertrand/FlightGear/Scenery/e000n40/ --aircraft=c172p
--airport=lfmd --nav1=1fgfs --fog-disable --timeofday=noon
--fg-scenery=/home/bertrand/FlightGear/Scenery/e000n40/ --aircraft=c172p
--airport=lfmd --nav1=109.95:45
nvfx_screen_get_param:94 -  Warning: unknown PIPE_CAP 29
FGMultiplayMgr - No receiver port, Multiplayermode disabled
Nasal runtime error: props.setAttribute() with invalid attribute
  at /usr/share/FlightGear/Nasal/props.nas, line 25
  called from: /usr/share/FlightGear/Nasal/gui.nas, line 137
KI266 dme indicator #0 initialized
loading scenario 'nimitz_demo'
Mesa 7.11-devel implementation error: _mesa_texstore_null() is called
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format MESA_FORMAT_NONE in
_mesa_format_to_type_and_comps
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Mesa 7.11-devel implementation error: bad format in do_row()
Please report at bugs.freedesktop.org
Warning: detected OpenGL error 'out of memory' after RenderBin::draw(,)
RenderStage::drawInner(,) FBO status= 0x8cd5
creating 3D noise texture... DONE
ALSA lib pcm.c:2212:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.rear
ALSA lib pcm.c:2212:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.center_lfe
ALSA lib pcm.c:2212:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.side
ALSA lib pcm.c:2212:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.surround71
ALSA lib pcm.c:2212:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.hdmi
ALSA lib pcm.c:2212:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.hdmi
ALSA lib pcm.c:2212:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.modem
ALSA lib pcm.c:2212:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.modem
ALSA lib pcm.c:2212:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.phoneline
ALSA lib pcm.c:2212:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.phoneline
ALSA lib pcm_dmix.c:957:(snd_pcm_dmix_open) The dmix plugin supports only
playback stream
ALSA lib pcm_dmix.c:1018:(snd_pcm_dmix_open) unable to open slave
Cannot connect to server socket err = No such file or directory
Cannot connect to server socket
jack server is not running or cannot be started
Initializing Nasal Electrical System
Warning: detected OpenGL error 'out of memory' after RenderBin::draw(,)
Warning: detected OpenGL error 'out of memory' after RenderBin::draw(,)
power up
Warning: detected OpenGL error 'out of memory' after RenderBin::draw(,)
Warning: detected OpenGL error 'out of memory' after RenderBin::draw(,)
Warning: detected OpenGL error 'out of memory' after RenderBin::draw(,)
Warning: detected OpenGL error 'out of memory' after RenderBin::draw(,)
Warning: detected OpenGL error 'out of memory' after RenderBin::draw(,)
Warning: detected OpenGL error 'out of memory' after RenderBin::draw(,)
Warning: detected OpenGL error 'out of memory' after RenderBin::draw(,)
Warning: detected OpenGL error 'out of memory' after RenderBin::draw(,)

[/code]

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
