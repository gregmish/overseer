import "../boot/boot_loader.dart";
import "../memory/synthetic_memory.dart";
import "../minions/minion_loader.dart";

class OverseerBootInit {
  final BootLoader boot = BootLoader();
  final SyntheticMemory memory = SyntheticMemory();
  final MinionLoader minions = MinionLoader();

  void start() {
    boot.run();
    memory.remember("status", "booted");
    minions.register("CoreOverseer");
  }
}
