From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56535] Resident evil 4 with wine: crash
Date: Wed, 07 Nov 2012 18:00:38 +0000
Message-ID: <bug-56535-8800-EtriVwGmQ6@http.bugs.freedesktop.org/>
References: <bug-56535-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1087970043=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56535-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1087970043==
Content-Type: multipart/alternative; boundary="1352311238.cde720.5861"; charset="us-ascii"


--1352311238.cde720.5861
Date: Wed, 7 Nov 2012 18:00:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D56535

--- Comment #13 from KinG-InFeT <king.infet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
unfortunately crashed without even giving me the opportunity to save the
backtrace, but I managed to asismilare information outputs from the termina=
l.

Test 1:
=E2=94=8C=E2=94=80[root] @ [KinG-InFeT]
=E2=94=94=E2=94=80[(~/.wine/drive_c/Program Files/CAPCOM/resident evil 4)] =
> wine game.exe
fixme:d3d:init_driver_info Unable to find a driver/device info for
vendor_id=3D0x10de device_id=3D0x421 for driver_model=3D2
fixme:win:EnumDisplayDevicesW ((null),0,0x7c7f608,0x00000000), stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1b55a0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x21fd38 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199d3d28 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199d3d28 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199d4150 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199d4150 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199f0f00 stub!
fixme:d3d:wined3d_device_set_software_vertex_processing device 0x13d9c0,
software 0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19ac2b70 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x93e7568 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x93e7800 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x93e7a98 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x93e7d30 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x93e7fe0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19ad2dc8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19ad6f20 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19adb0b8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19adb3a8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19adb698 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19adb988 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19adbc78 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d142438 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d142ee8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1439b0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1444b8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d144fc0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d145ac8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1465d0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1470d8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1493e0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1596e8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d159df0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d15e0f8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d160400 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d164708 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d16ca10 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d170d18 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d175020 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d179328 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d17d630 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d181938 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d185c40 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d186348 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d196650 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1b6958 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1b7c60 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1c7f68 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1e8270 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1ec578 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1ee880 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1f0b88 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d200e90 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d202198 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2034a0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2237a8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d263ab0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d273db8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2740a8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2753b0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2b56b8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2c59c0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2c5cb0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2c9fb8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2ce2c0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2d25c8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2d48d0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2d8bd8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2dcee0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2e11e8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2e54f0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2e97f8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2ebb00 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2efe08 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2f8110 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2f8400 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2f9708 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2faa10 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2fbd18 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2fc008 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33c310 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33c600 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33d108 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33f410 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33f700 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33f9f0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33fce0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d341fe8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d3432f0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d3445f8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d345900 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d346c08 stub!
ALSA lib seq_hw.c:457:(snd_seq_hw_open) open /dev/snd/seq failed: Nessun de=
vice
corrisponde

(process:8517): GThread-WARNING **: GThread system no longer supports custom
thread implementations.
fixme:gstreamer:init_new_decoded_pad Linking: 0
fixme:gstreamer:init_new_decoded_pad Linking: 0
fixme:gstreamer:no_more_pads Done
fixme:gstreamer:event_sink 0x7c909550 stub tag
fixme:gstreamer:event_sink 0x7c909090 stub tag
fixme:gstreamer:event_sink 0x7c9090c0 stub tag
fixme:gstreamer:got_data_sink Triggering 0x7bb6db30 0x6f8
fixme:gstreamer:got_data_sink Triggering 0x7bb6dbf8 0x6fc
fixme:gstreamer:GST_QueryInterface No interface for
{56a868b3-0ad4-11ce-b03a-0020af0ba770}!
fixme:strmbase:TransformFilterImpl_QueryInterface No interface for
{56a868b3-0ad4-11ce-b03a-0020af0ba770}!
wine: Unhandled page fault on write access to 0x00000005 at address 0x41acea
(thread 0031), starting debugger...
err:seh:start_debugger Couldn't start debugger ("") (2)
Read the Wine Developers Guide on how to set up winedbg or another debugger
fixme:gstreamer:no_more_pads Done
fixme:gstreamer:event_sink 0x7c9095b0 stub tag
fixme:gstreamer:event_sink 0x7c618490 stub tag
fixme:gstreamer:event_sink 0x7c6184c0 stub tag
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
err:quartz:DSoundRender_SendSampleData 0
=E2=94=8C=E2=94=80[root] @ [KinG-InFeT]
=E2=94=94=E2=94=80[(~/.wine/drive_c/Program Files/CAPCOM/resident evil 4)] =
>=20
--end test 1=20

Test 2:
=E2=94=94=E2=94=80[(~/.wine/drive_c/Program Files/CAPCOM/resident evil 4)] =
> wine game.exe
fixme:d3d:init_driver_info Unable to find a driver/device info for
vendor_id=3D0x10de device_id=3D0x421 for driver_model=3D2
fixme:win:EnumDisplayDevicesW ((null),0,0x7c7f608,0x00000000), stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1b55a0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x21fd38 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199d3d28 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199d3d28 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199d4150 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199d4150 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199f0f00 stub!
fixme:d3d:wined3d_device_set_software_vertex_processing device 0x13d9c0,
software 0 stub!
malloc.c:2879: __libc_malloc: Assertion `!victim ||
((((mchunkptr)((char*)(victim) - 2*(sizeof(size_t)))))->size & 0x2) || ar_p=
tr
=3D=3D (((((mchunkptr)((char*)(victim) - 2*(sizeof(size_t)))))->size & 0x4)=
 ?
((heap_info *)((unsigned long)(((mchunkptr)((char*)(victim) -
2*(sizeof(size_t))))) & ~((2 * (512 * 1024))-1)))->ar_ptr : &main_arena)'
failed.
wine: Assertion failed at address 0xb7712424 (thread 0029), starting
debugger...
malloc.c:2879: __libc_malloc: Assertion `!victim ||
((((mchunkptr)((char*)(victim) - 2*(sizeof(size_t)))))->size & 0x2) || ar_p=
tr
=3D=3D (((((mchunkptr)((char*)(victim) - 2*(sizeof(size_t)))))->size & 0x4)=
 ?
((heap_info *)((unsigned long)(((mchunkptr)((char*)(victim) -
2*(sizeof(size_t))))) & ~((2 * (512 * 1024))-1)))->ar_ptr : &main_arena)'
failed.
fixme:console:CONSOLE_DefaultHandler Terminating process 8 on event 0

 --end test2.

Test 3:
=E2=94=8C=E2=94=80[root] @ [KinG-InFeT]
=E2=94=94=E2=94=80[(~/.wine/drive_c/Program Files/CAPCOM/resident evil 4)] =
> wine game.exe
fixme:d3d:init_driver_info Unable to find a driver/device info for
vendor_id=3D0x10de device_id=3D0x421 for driver_model=3D2
fixme:win:EnumDisplayDevicesW ((null),0,0x7c7f608,0x00000000), stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1b55a0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x21fd38 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199d3d28 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199d3d28 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199d4150 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199d4150 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199f0f00 stub!
fixme:d3d:wined3d_device_set_software_vertex_processing device 0x13d9c0,
software 0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19ac2b70 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x945db78 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x945de10 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x945e0c0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x945e3b0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x945e6a0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19ad1880 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d0f6f68 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19ad5b88 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d0fb270 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19ad9e90 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19ad9ff8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19ada160 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1438b8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19adac68 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19adb600 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19adb8f0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19adbbe0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d145c08 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1466b8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d147168 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d149418 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d159708 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d159e10 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d15e118 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d160420 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d164728 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d16ca30 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d170d38 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d175040 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d179348 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d17d650 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d181958 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d185c60 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d186368 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d196670 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1b6978 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1b7c80 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1c7f88 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1e8290 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1ec598 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1ee8a0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1f0ba8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d200eb0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2021b8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2034c0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2237c8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d263ad0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d273dd8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2740c8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2753d0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2b56d8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2c59e0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2c5cd0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2c9fd8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2ce2e0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2d25e8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2d48f0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2d8bf8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2dcf00 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2e1208 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2e5510 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2e9818 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2ebb20 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2efe28 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2f8130 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2f8420 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2f9728 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2faa30 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2fbd38 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2fc028 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33c330 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33c620 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33d128 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33f430 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33f720 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33fa10 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33fd00 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d342008 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d343310 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d344618 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d345920 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d346c28 stub!
ALSA lib seq_hw.c:457:(snd_seq_hw_open) open /dev/snd/seq failed: Nessun de=
vice
corrisponde

(process:8629): GThread-WARNING **: GThread system no longer supports custom
thread implementations.
fixme:gstreamer:init_new_decoded_pad Linking: 0
fixme:gstreamer:init_new_decoded_pad Linking: 0
fixme:gstreamer:no_more_pads Done
fixme:gstreamer:event_sink 0x79a6ed50 stub tag
fixme:gstreamer:even0x79a6f0c0 stub tag
fixme:gstreamer:got_data_sink Triggering 0x79a89328 0x6fc
fixme:gstreamer:got_data_sink Triggering 0x79a893f0 0x70c
fixme:gstreamer:GST_QueryInterface No interface for
{56a868b3-0ad4-11ce-b03a-0020af0ba770}!
fixme:strmbase:TransformFilterImpl_QueryInterface No interface for
{56a868b3-0ad4-11ce-b03a-0020af0ba770}!
fixme:gstreamer:no_more_pads Done
fixme:gstreamer:event_sink 0x79a6edb0 stub tag
fixme:gstreamer:event_sink 0x7c60d490 stub tag
fixme:gstreamer:event_sink 0x7c60d4c0 stub tag
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
err:quartz:BaseMemAllocator_ReleaseBuffer ReleaseSemaphore failed with error
997
^Cfixme:console:CONSOLE_DefaultHandler Terminating process 8 on event 0
wine client error:31: partial wakeup read 0
wine client error:31: partial wakeup read 0

-- end test 3

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1352311238.cde720.5861
Date: Wed, 7 Nov 2012 18:00:38 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Resident evil 4 with wine: crash"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D56535#c13">Commen=
t # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Resident evil 4 with wine: crash"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D56535">bug 56535<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
king.infet&#64;gmail.com" title=3D"KinG-InFeT &lt;king.infet&#64;gmail.com&=
gt;"> <span class=3D"fn">KinG-InFeT</span></a>
</span></b>
        <pre>unfortunately crashed without even giving me the opportunity t=
o save the
backtrace, but I managed to asismilare information outputs from the termina=
l.

Test 1:
=E2=94=8C=E2=94=80[root] &#64; [KinG-InFeT]
=E2=94=94=E2=94=80[(~/.wine/drive_c/Program Files/CAPCOM/resident evil 4)] =
&gt; wine game.exe
fixme:d3d:init_driver_info Unable to find a driver/device info for
vendor_id=3D0x10de device_id=3D0x421 for driver_model=3D2
fixme:win:EnumDisplayDevicesW ((null),0,0x7c7f608,0x00000000), stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1b55a0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x21fd38 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199d3d28 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199d3d28 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199d4150 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199d4150 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199f0f00 stub!
fixme:d3d:wined3d_device_set_software_vertex_processing device 0x13d9c0,
software 0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19ac2b70 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x93e7568 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x93e7800 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x93e7a98 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x93e7d30 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x93e7fe0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19ad2dc8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19ad6f20 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19adb0b8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19adb3a8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19adb698 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19adb988 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19adbc78 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d142438 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d142ee8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1439b0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1444b8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d144fc0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d145ac8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1465d0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1470d8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1493e0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1596e8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d159df0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d15e0f8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d160400 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d164708 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d16ca10 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d170d18 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d175020 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d179328 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d17d630 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d181938 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d185c40 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d186348 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d196650 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1b6958 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1b7c60 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1c7f68 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1e8270 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1ec578 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1ee880 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1f0b88 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d200e90 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d202198 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2034a0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2237a8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d263ab0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d273db8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2740a8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2753b0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2b56b8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2c59c0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2c5cb0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2c9fb8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2ce2c0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2d25c8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2d48d0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2d8bd8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2dcee0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2e11e8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2e54f0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2e97f8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2ebb00 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2efe08 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2f8110 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2f8400 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2f9708 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2faa10 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2fbd18 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2fc008 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33c310 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33c600 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33d108 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33f410 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33f700 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33f9f0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33fce0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d341fe8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d3432f0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d3445f8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d345900 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d346c08 stub!
ALSA lib seq_hw.c:457:(snd_seq_hw_open) open /dev/snd/seq failed: Nessun de=
vice
corrisponde

(process:8517): GThread-WARNING **: GThread system no longer supports custom
thread implementations.
fixme:gstreamer:init_new_decoded_pad Linking: 0
fixme:gstreamer:init_new_decoded_pad Linking: 0
fixme:gstreamer:no_more_pads Done
fixme:gstreamer:event_sink 0x7c909550 stub tag
fixme:gstreamer:event_sink 0x7c909090 stub tag
fixme:gstreamer:event_sink 0x7c9090c0 stub tag
fixme:gstreamer:got_data_sink Triggering 0x7bb6db30 0x6f8
fixme:gstreamer:got_data_sink Triggering 0x7bb6dbf8 0x6fc
fixme:gstreamer:GST_QueryInterface No interface for
{56a868b3-0ad4-11ce-b03a-0020af0ba770}!
fixme:strmbase:TransformFilterImpl_QueryInterface No interface for
{56a868b3-0ad4-11ce-b03a-0020af0ba770}!
wine: Unhandled page fault on write access to 0x00000005 at address 0x41acea
(thread 0031), starting debugger...
err:seh:start_debugger Couldn't start debugger (&quot;&quot;) (2)
Read the Wine Developers Guide on how to set up winedbg or another debugger
fixme:gstreamer:no_more_pads Done
fixme:gstreamer:event_sink 0x7c9095b0 stub tag
fixme:gstreamer:event_sink 0x7c618490 stub tag
fixme:gstreamer:event_sink 0x7c6184c0 stub tag
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
err:quartz:DSoundRender_SendSampleData 0
=E2=94=8C=E2=94=80[root] &#64; [KinG-InFeT]
=E2=94=94=E2=94=80[(~/.wine/drive_c/Program Files/CAPCOM/resident evil 4)] =
&gt;=20
--end test 1=20

Test 2:
=E2=94=94=E2=94=80[(~/.wine/drive_c/Program Files/CAPCOM/resident evil 4)] =
&gt; wine game.exe
fixme:d3d:init_driver_info Unable to find a driver/device info for
vendor_id=3D0x10de device_id=3D0x421 for driver_model=3D2
fixme:win:EnumDisplayDevicesW ((null),0,0x7c7f608,0x00000000), stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1b55a0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x21fd38 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199d3d28 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199d3d28 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199d4150 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199d4150 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199f0f00 stub!
fixme:d3d:wined3d_device_set_software_vertex_processing device 0x13d9c0,
software 0 stub!
malloc.c:2879: __libc_malloc: Assertion `!victim ||
((((mchunkptr)((char*)(victim) - 2*(sizeof(size_t)))))-&gt;size &amp; 0x2) =
|| ar_ptr
=3D=3D (((((mchunkptr)((char*)(victim) - 2*(sizeof(size_t)))))-&gt;size &am=
p; 0x4) ?
((heap_info *)((unsigned long)(((mchunkptr)((char*)(victim) -
2*(sizeof(size_t))))) &amp; ~((2 * (512 * 1024))-1)))-&gt;ar_ptr : &amp;mai=
n_arena)'
failed.
wine: Assertion failed at address 0xb7712424 (thread 0029), starting
debugger...
malloc.c:2879: __libc_malloc: Assertion `!victim ||
((((mchunkptr)((char*)(victim) - 2*(sizeof(size_t)))))-&gt;size &amp; 0x2) =
|| ar_ptr
=3D=3D (((((mchunkptr)((char*)(victim) - 2*(sizeof(size_t)))))-&gt;size &am=
p; 0x4) ?
((heap_info *)((unsigned long)(((mchunkptr)((char*)(victim) -
2*(sizeof(size_t))))) &amp; ~((2 * (512 * 1024))-1)))-&gt;ar_ptr : &amp;mai=
n_arena)'
failed.
fixme:console:CONSOLE_DefaultHandler Terminating process 8 on event 0

 --end test2.

Test 3:
=E2=94=8C=E2=94=80[root] &#64; [KinG-InFeT]
=E2=94=94=E2=94=80[(~/.wine/drive_c/Program Files/CAPCOM/resident evil 4)] =
&gt; wine game.exe
fixme:d3d:init_driver_info Unable to find a driver/device info for
vendor_id=3D0x10de device_id=3D0x421 for driver_model=3D2
fixme:win:EnumDisplayDevicesW ((null),0,0x7c7f608,0x00000000), stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1b55a0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x21fd38 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199d3d28 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199d3d28 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199d4150 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199d4150 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x199f0f00 stub!
fixme:d3d:wined3d_device_set_software_vertex_processing device 0x13d9c0,
software 0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19ac2b70 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x945db78 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x945de10 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x945e0c0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x945e3b0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x945e6a0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19ad1880 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d0f6f68 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19ad5b88 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d0fb270 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19ad9e90 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19ad9ff8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19ada160 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1438b8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19adac68 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19adb600 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19adb8f0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x19adbbe0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d145c08 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1466b8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d147168 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d149418 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d159708 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d159e10 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d15e118 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d160420 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d164728 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d16ca30 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d170d38 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d175040 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d179348 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d17d650 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d181958 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d185c60 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d186368 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d196670 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1b6978 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1b7c80 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1c7f88 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1e8290 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1ec598 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1ee8a0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d1f0ba8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d200eb0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2021b8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2034c0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2237c8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d263ad0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d273dd8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2740c8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2753d0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2b56d8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2c59e0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2c5cd0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2c9fd8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2ce2e0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2d25e8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2d48f0 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2d8bf8 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2dcf00 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2e1208 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2e5510 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2e9818 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2ebb20 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2efe28 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2f8130 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2f8420 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2f9728 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2faa30 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2fbd38 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d2fc028 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33c330 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33c620 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33d128 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33f430 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33f720 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33fa10 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d33fd00 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d342008 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d343310 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d344618 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d345920 stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1d346c28 stub!
ALSA lib seq_hw.c:457:(snd_seq_hw_open) open /dev/snd/seq failed: Nessun de=
vice
corrisponde

(process:8629): GThread-WARNING **: GThread system no longer supports custom
thread implementations.
fixme:gstreamer:init_new_decoded_pad Linking: 0
fixme:gstreamer:init_new_decoded_pad Linking: 0
fixme:gstreamer:no_more_pads Done
fixme:gstreamer:event_sink 0x79a6ed50 stub tag
fixme:gstreamer:even0x79a6f0c0 stub tag
fixme:gstreamer:got_data_sink Triggering 0x79a89328 0x6fc
fixme:gstreamer:got_data_sink Triggering 0x79a893f0 0x70c
fixme:gstreamer:GST_QueryInterface No interface for
{56a868b3-0ad4-11ce-b03a-0020af0ba770}!
fixme:strmbase:TransformFilterImpl_QueryInterface No interface for
{56a868b3-0ad4-11ce-b03a-0020af0ba770}!
fixme:gstreamer:no_more_pads Done
fixme:gstreamer:event_sink 0x79a6edb0 stub tag
fixme:gstreamer:event_sink 0x7c60d490 stub tag
fixme:gstreamer:event_sink 0x7c60d4c0 stub tag
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
fixme:gstreamer:got_data_sink Did not get a GST_APP_BUFFER, creating a samp=
le
err:quartz:BaseMemAllocator_ReleaseBuffer ReleaseSemaphore failed with error
997
^Cfixme:console:CONSOLE_DefaultHandler Terminating process 8 on event 0
wine client error:31: partial wakeup read 0
wine client error:31: partial wakeup read 0

-- end test 3</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1352311238.cde720.5861--

--===============1087970043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1087970043==--
